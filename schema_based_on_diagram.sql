-- database is created

CREATE DATABASE clinic;

CREATE TABLE patients (id serial PRIMARY KEY, name VARCHAR(225), date_of_birth date);

CREATE TABLE invoices (id serial PRIMARY KEY, total_amount DECIMAl, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT, CONSTRAINT fk_medical FOREIGN KEY (medical_history_id) REFERENCES medical_histories (id));

CREATE TABLE medical_histories (id serial PRIMARY KEY, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(225), FOREIGN KEY (patient_id) REFERENCES patients (id));

CREATE TABLE treatments (id serial PRIMARY KEY, type VARCHAR(225), name VARCHAR(225));

CREATE TABLE invoice_items (id serial PRIMARY KEY, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT, treatment_id INT, CONSTRAINT fk_invoices FOREIGN KEY (invoice_id) REFERENCES invoices (id), CONSTRAINT fk_treatments FOREIGN KEY (treatment_id) REFERENCES treatments (id));

CREATE TABLE medical_histories_treatments ( medical_id int, treatment_id int, PRIMARY KEY (medical_id, treatment_id), CONSTRAINT fk_medical FOREIGN KEY (medical_id) REFERENCES medical_histories(id), CONSTRAINT fk_treatments Foreign Key (treatment_id) REFERENCES treatment(id));

CREATE INDEX ON medical_histories (patient_id);

CREATE INDEX ON invoices (medical_history_id);

CREATE INDEX ON invoice_items(treatment_id);

CREATE INDEX ON invoice_items(invoice_id);

CREATE INDEX ON medical_histories_treatments(medical_id);

CREATE INDEX ON medical_histories_treatments (treatment_id);