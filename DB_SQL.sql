CREATE TABLE Owners (
  owner_id INT PRIMARY KEY,
  owner_name VARCHAR(50),
  contact_number VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(100)
);


CREATE TABLE Tenants (
  tenant_id INT PRIMARY KEY,
  tenant_name VARCHAR(50),
  contact_number VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(100),
  move_in_date DATE,
  move_out_date DATE,
  apartment_id INT,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);


CREATE TABLE Apartments (
  apartment_id INT PRIMARY KEY,
  apartment_number VARCHAR(10),
  floor_number INT,
  building_name VARCHAR(50),
  owner_id INT,
  FOREIGN KEY (owner_id) REFERENCES Owners (owner_id),
  is_occupied BOOLEAN DEFAULT false,
  is_under_maintenance BOOLEAN DEFAULT false
);


CREATE TABLE SecurityCameras (
  camera_id INT PRIMARY KEY,
  camera_location VARCHAR(50),
  apartment_id INT,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);


CREATE TABLE AutomatedGates (
  gate_id INT PRIMARY KEY,
  gate_location VARCHAR(50),
  apartment_id INT,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE MaintenanceServices (
  service_id INT PRIMARY KEY,
  service_name VARCHAR(50),
  service_description VARCHAR(100)
);



CREATE TABLE MaintenanceRequests (
  request_id INT PRIMARY KEY,
  apartment_id INT,
  service_id INT,
  request_date DATE,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id),
  FOREIGN KEY (service_id) REFERENCES MaintenanceServices (service_id),
  status VARCHAR(20) DEFAULT 'Pending',
  remarks VARCHAR(100)
);




CREATE TABLE RentPayments (
  payment_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  payment_date DATE,
  amount DECIMAL(10, 2),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE Visitors (
  visitor_id INT PRIMARY KEY,
  visitor_name VARCHAR(50),
  visitor_contact_number VARCHAR(20),
  apartment_id INT,
  visit_date DATE,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE Amenities (
  amenity_id INT PRIMARY KEY,
  amenity_name VARCHAR(50),
  amenity_description VARCHAR(100)
);



CREATE TABLE ApartmentAmenities (
  apartment_id INT,
  amenity_id INT,
  PRIMARY KEY (apartment_id, amenity_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id),
  FOREIGN KEY (amenity_id) REFERENCES Amenities (amenity_id)
);



CREATE TABLE LeaseAgreements (
  agreement_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  start_date DATE,
  end_date DATE,
  monthly_rent DECIMAL(10, 2),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE MaintenanceLogs (
  log_id INT PRIMARY KEY,
  request_id INT,
  completion_date DATE,
  remarks VARCHAR(100),
  FOREIGN KEY (request_id) REFERENCES MaintenanceRequests (request_id)
);



CREATE TABLE Staff (
  staff_id INT PRIMARY KEY,
  staff_name VARCHAR(50),
  contact_number VARCHAR(20),
  email VARCHAR(50),
  role VARCHAR(50)
);



CREATE TABLE StaffAssignments (
  assignment_id INT PRIMARY KEY,
  staff_id INT,
  request_id INT,
  assignment_date DATE,
  FOREIGN KEY (staff_id) REFERENCES Staff (staff_id),
  FOREIGN KEY (request_id) REFERENCES MaintenanceRequests (request_id)
);


Few more for complex solutions

CREATE TABLE Complaints (
  complaint_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  complaint_date DATE,
  description VARCHAR(200),
  status VARCHAR(20) DEFAULT 'Pending',
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE Notices (
  notice_id INT PRIMARY KEY,
  title VARCHAR(100),
  content VARCHAR(200),
  publish_date DATE
);



CREATE TABLE MaintenanceSchedule (
  schedule_id INT PRIMARY KEY,
  apartment_id INT,
  service_id INT,
  day_of_week VARCHAR(20),
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id),
  FOREIGN KEY (service_id) REFERENCES MaintenanceServices (service_id)
);



CREATE TABLE Payments (
  payment_id INT PRIMARY KEY,
  apartment_id INT,
  payment_date DATE,
  amount DECIMAL(10, 2),
  payment_type VARCHAR(50),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE InvoiceItems (
  item_id INT PRIMARY KEY,
  description VARCHAR(200),
  amount DECIMAL(10, 2)
);


CREATE TABLE Invoices (
  invoice_id INT PRIMARY KEY,
  tenant_id INT,
  invoice_date DATE,
  due_date DATE,
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);


CREATE TABLE InsurancePolicies (
  policy_id INT PRIMARY KEY,
  apartment_id INT,
  insurance_provider VARCHAR(50),
  policy_number VARCHAR(50),
  coverage_amount DECIMAL(10, 2),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);




Parcels, packages

CREATE TABLE ParkingSpaces (
  space_id INT PRIMARY KEY,
  space_number VARCHAR(10),
  apartment_id INT,
  tenant_id INT,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);


CREATE TABLE Packages (
  package_id INT PRIMARY KEY,
  tenant_id INT,
  carrier_name VARCHAR(50),
  tracking_number VARCHAR(50),
  received_date DATE,
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);



CREATE TABLE Events (
  event_id INT PRIMARY KEY,
  event_name VARCHAR(100),
  event_date DATE,
  description VARCHAR(200)
);



CREATE TABLE EventAttendees (
  event_id INT,
  tenant_id INT,
  PRIMARY KEY (event_id, tenant_id),
  FOREIGN KEY (event_id) REFERENCES Events (event_id),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);



CREATE TABLE Announcements (
  announcement_id INT PRIMARY KEY,
  title VARCHAR(100),
  content VARCHAR(200),
  publish_date DATE
);



CREATE TABLE Feedback (
  feedback_id INT PRIMARY KEY,
  tenant_id INT,
  feedback_date DATE,
  content VARCHAR(200),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id)
);



CREATE TABLE VisitorsLog (
  log_id INT PRIMARY KEY,
  visitor_id INT,
  visit_date DATE,
  check_in_time TIME,
  check_out_time TIME,
  FOREIGN KEY (visitor_id) REFERENCES Visitors (visitor_id)
);



CREATE TABLE EmergencyContacts (
  contact_id INT PRIMARY KEY,
  contact_name VARCHAR(50),
  contact_number VARCHAR(20),
  contact_type VARCHAR(50)
);



CREATE TABLE Expenses (
  expense_id INT PRIMARY KEY,
  description VARCHAR(200),
  amount DECIMAL(10, 2),
  expense_date DATE
);


CREATE TABLE MaintenanceSuppliers (
  supplier_id INT PRIMARY KEY,
  supplier_name VARCHAR(50),
  contact_number VARCHAR(20),
  email VARCHAR(50),
  address VARCHAR(100)
);



CREATE TABLE PurchaseOrders (
  order_id INT PRIMARY KEY,
  supplier_id INT,
  order_date DATE,
  total_amount DECIMAL(10, 2),
  status VARCHAR(20),
  FOREIGN KEY (supplier_id) REFERENCES MaintenanceSuppliers (supplier_id)
);



CREATE TABLE PurchaseOrderItems (
  item_id INT PRIMARY KEY,
  order_id INT,
  item_description VARCHAR(200),
  quantity INT,
  price DECIMAL(10, 2),
  FOREIGN KEY (order_id) REFERENCES PurchaseOrders (order_id)
);



CREATE TABLE TenancyAgreements (
  agreement_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  start_date DATE,
  end_date DATE,
  monthly_rent DECIMAL(10, 2),
  deposit_amount DECIMAL(10, 2),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE WorkOrders (
  order_id INT PRIMARY KEY,
  apartment_id INT,
  description VARCHAR(200),
  order_date DATE,
  status VARCHAR(20),
  remarks VARCHAR(200),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE WorkOrderTasks (
  task_id INT PRIMARY KEY,
  order_id INT,
  task_description VARCHAR(200),
  completion_date DATE,
  status VARCHAR(20),
  remarks VARCHAR(200),
  FOREIGN KEY (order_id) REFERENCES WorkOrders (order_id)
);


CREATE TABLE MoveInChecklist (
  checklist_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  move_in_date DATE,
  item_description VARCHAR(200),
  is_checked BOOLEAN,
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);


CREATE TABLE MoveOutChecklist (
  checklist_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  move_out_date DATE,
  item_description VARCHAR(200),
  is_checked BOOLEAN,
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);








CREATE TABLE LeaseTermination (
  termination_id INT PRIMARY KEY,
  tenant_id INT,
  apartment_id INT,
  termination_date DATE,
  reason VARCHAR(200),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);


CREATE TABLE Vacancies (
  vacancy_id INT PRIMARY KEY,
  apartment_id INT,
  available_from DATE,
  is_filled BOOLEAN DEFAULT false,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE AmenitiesBooking (
  booking_id INT PRIMARY KEY,
  tenant_id INT,
  amenity_id INT,
  booking_date DATE,
  start_time TIME,
  end_time TIME,
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (amenity_id) REFERENCES Amenities (amenity_id)
);



CREATE TABLE ApartmentDocuments (
  document_id INT PRIMARY KEY,
  apartment_id INT,
  document_name VARCHAR(100),
  document_path VARCHAR(200),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE EnergyConsumption (
  consumption_id INT PRIMARY KEY,
  apartment_id INT,
  reading_date DATE,
  electricity_reading DECIMAL(10, 2),
  water_reading DECIMAL(10, 2),
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE CommunityPolls (
  poll_id INT PRIMARY KEY,
  question VARCHAR(200),
  start_date DATE,
  end_date DATE,
  FOREIGN KEY (apartment_id) REFERENCES Apartments (apartment_id)
);



CREATE TABLE PollOptions (
  option_id INT PRIMARY KEY,
  poll_id INT,
  option_text VARCHAR(200),
  FOREIGN KEY (poll_id) REFERENCES CommunityPolls (poll_id)
);




CREATE TABLE PollVotes (
  vote_id INT PRIMARY KEY,
  poll_id INT,
  tenant_id INT,
  option_id INT,
  FOREIGN KEY (poll_id) REFERENCES CommunityPolls (poll_id),
  FOREIGN KEY (tenant_id) REFERENCES Tenants (tenant_id),
  FOREIGN KEY (option_id) REFERENCES PollOptions (option_id)
);




CREATE TABLE LeaseRenewals (
  renewal_id INT PRIMARY KEY,
  lease_id INT,
  renewal_date DATE,
  new_start_date DATE,
  new_end_date DATE,
  new_monthly_rent DECIMAL(10, 2),
  FOREIGN KEY (lease_id) REFERENCES TenancyAgreements (agreement_id)
);










