-- database is created
CREATE DATABASE clinic;

CREATE TABLE patients (id serial PRIMARY KEY, name VARCHAR(225), date_of_birth date);

CREATE TABLE invoices (id serial PRIMARY KEY, total_amount DECIMAl, generated_at TIMESTAMP, payed_at TIMESTAMP, medical_history_id INT);

CREATE TABLE medical_histories (id INT, admitted_at TIMESTAMP, patient_id INT, status VARCHAR(225), PRIMARY KEY (id, patient_id), FOREIGN KEY (patient_id) REFERENCES patients (id));

CREATE TABLE treatments (id INT, type VARCHAR(225), name VARCHAR(225), PRIMARY KEY (id));

CREATE TABLE invoice_items (id INT, unit_price DECIMAL, quantity INT, total_price DECIMAL, invoice_id INT, treatment_id INT, PRIMARY KEY (id), FOREIGN KEY (invoice_id) REFERENCES invoices (id), FOREIGN KEY (treatment_id) REFERENCES treatments (id));