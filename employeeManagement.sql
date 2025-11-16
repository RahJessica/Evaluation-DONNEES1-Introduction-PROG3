-- CREATION DES TABLES --
CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    contract_type VARCHAR(50),
    salary INT,
    team_id INT NOT NULL,
    CONSTRAINT fk_employee_team
        FOREIGN KEY (team_id) REFERENCES team(id)
);

CREATE TABLE leave (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_leave_employee
        FOREIGN KEY (employee_id) REFERENCES employee(id)
);