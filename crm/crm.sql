-- Drops existing tables, so we start fresh with each
-- run of this script
-- e.g. DROP TABLE IF EXISTS ______;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS activities;
DROP TABLE IF EXISTS salespeople;
DROP TABLE IF EXISTS companies;

-- CREATE TABLES
CREATE TABLE contacts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    company_id INTEGER,
    title TEXT,
    salesperson_id TEXT,

    FOREIGN KEY (company_id) REFERENCES companies(id),
    FOREIGN KEY (salesperson_id) REFERENCES salespeople(id)
);

CREATE TABLE activities (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    method TEXT,
    ocurred_at TEXT, -- convention to say it's the date when the activity ocurred
    notes TEXT,
    contact_id INTEGER,
    salesperson_id INTEGER

    FOREIGN KEY (contact_id) REFERENCES contacts(id)
    FOREIGN KEY (salesperson_id) REFERENCES salespeople(id)
);

CREATE TABLE salespeople (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT
);

CREATE TABLE companies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    industry TEXT
);