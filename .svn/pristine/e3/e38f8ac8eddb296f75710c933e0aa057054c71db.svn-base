class Customer < ActiveRecord::Base
  #belongs_to :user
  has_and_belongs_to_many :ctypes, join_table: :cassociations
  has_and_belongs_to_many :vendors, join_table: :customers_vendors
  has_many :users, dependent: :destroy
  has_many :user_invites, dependent: :destroy
  accepts_nested_attributes_for :user_invites, allow_destroy: true, reject_if: proc { |user_invites| user_invites[:email].blank? }
  
  validates :name, presence: true
  #validates :poc_first_name, presence: true
  #validates :poc_last_name, presence: true
  #validates :poc_email, presence: true
  #validates_format_of :poc_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  
  
    def self.validate_header(header)
    logger.debug "Customer.validate_header - header received is #{header}"
    if header[0] != "name" then
      logger.error "Customer.validate_header - first column is #{header[0]}"
      return false
      
    else
      logger.debug "Customer.validate_header - Valid XLS file. Moving forward..."
      return true
    end
  end
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    if validate_header(header) then
      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        logger.debug "Customer.import - row is #{row}"
        @ctypes = Array.new
        ctypes = row['ctypes'].split(',').map(&:strip)
        ctypes.each do |v|
          ctype = Ctype.where(name: v)
          if ctype.blank?
            ctype = Ctype.new
            ctype.name = v
            ctype.save!
            @ctypes.push(ctype.id)
          else
            ctype_id = Ctype.where(name: v).first.id
            @ctypes.push(ctype_id)
          end
        end
        @vendors = Array.new
        vendors = row['vendors'].split(',').map(&:strip)
        vendors.each do |c|
          vendor = Vendor.where(name: c)
          if vendor.blank?
            vendor = Vendor.new
            vendor.name = c
            vendor.save!
            @vendors.push(vendor.id)
          else
            vendor_id = Vendor.where(name: c).first.id
            @vendors.push(vendor_id)
          end
        end
        
        new_customer = Customer.new
        new_customer.name = row['name']
        new_customer.address = row['address']
        new_customer.city = row['city']
        new_customer.ctype_ids = @ctypes
        new_customer.vendor_ids = @vendors
        new_customer.size = row['no. of employees']
        new_customer.zipcode = row['zipcode']
        new_customer.state = row['state']
        new_customer.poc_first_name = row['poc_first_name']
        new_customer.poc_last_name = row['poc_last_name']
        new_customer.poc_email = row['poc_email']
        new_customer.poc_phone = row['poc_phone']
        new_customer.gross_revenue = row['gross_revenue']
        new_customer.save!
      end
      
    else
      logger.error "Customer.import invalid xls file. Exitting without creating a campaign template"
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
