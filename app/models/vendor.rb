class Vendor < ActiveRecord::Base
  has_many :campaigns
  has_many :metric_scores
  
  has_and_belongs_to_many :vtypes, join_table: :vassociations
  has_and_belongs_to_many :customers, join_table: :customers_vendors
  validates :name, presence: true
  
  def self.validate_header(header)
    logger.debug "Campaign.validate_header - header received is #{header}"
    if header[0] != "name" then
      logger.error "Campaign.validate_header - first column is #{header[0]}"
      return false
      
    else
      logger.debug "Campaign.validate_header - Valid XLS file. Moving forward..."
      return true
    end
  end
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    if validate_header(header) then
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        logger.debug "Vendor.import - row is #{row}"
        @vtypes = Array.new
        vtypes = row['vtypes'].split(',').map(&:strip)
        vtypes.each do |v|
          vtype = Vtype.where(name: v)
          if vtype.blank?
            vtype = Vtype.new
            vtype.name = v
            vtype.save!
            @vtypes.push(vtype.id)
            logger.debug "Vtype: #{vtype.id}"
          else
            vtype_id = Vtype.where(name: v).first.id
            @vtypes.push(vtype_id)
          end
        end
        @customers = Array.new
        customers = row['customers'].split(',').map(&:strip)
        customers.each do |c|
          customer = Customer.where(name: c)
          if customer.blank?
            customer = Customer.new
            customer.name = c
            customer.save!
            @customers.push(customer.id)
            logger.debug "Customer: #{customer.id}"
          else
            customer_id = Customer.where(name: c).first.id
            @customers.push(customer_id)
          end
        end
        no_of_vendors = Vendor.all.count
        
        new_vendor = Vendor.new
        new_vendor.id = no_of_vendors.to_i + 1
        new_vendor.name = row['name']
        new_vendor.address = row['address']
        new_vendor.city = row['city']
        new_vendor.vtype_ids = @vtypes
        new_vendor.customer_ids = @customers
        new_vendor.size = row['no. of employees']
        new_vendor.zipcode = row['zipcode']
        new_vendor.state = row['state']
        new_vendor.cw = row['complexity weight']
        new_vendor.poc_name = row['poc_name']
        new_vendor.poc_phone = row['poc_phone']
        new_vendor.revenue = row['gross_revenue']
        new_vendor.save!
      end
      
    else
      logger.error "Vendor.import invalid xls file. Exitting without creating a campaign template"
      return  
    end
  end
  
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end
end