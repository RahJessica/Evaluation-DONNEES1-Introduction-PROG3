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

-- DONNEES INSERT --
INSERT INTO team (name) VALUES
('Développement'),
('Marketing'),
('Finance');

INSERT INTO employee (first_name, last_name, contract_type, salary, team_id) VALUES
('Alice', 'Rakoto', 'CDI', 1500000, 1),
('Bob', 'Randria', 'CDD', 1200000, 1),
('Clara', 'Rasol', 'CDI', 1800000, 2),
('David', 'Andry', 'Stage', 400000,  2),
('Eva', 'Rabe', 'CDI', 2200000, 3),
('Faly', 'Rak', 'CDD', 1300000, 3),
('Gina', 'Rats', 'Stage', 300000, 1),
('Hery', 'Ranaivo', 'CDI', 2000000, 2);

INSERT INTO leave (start_date, end_date, employee_id) VALUES
('2025-11-14', '2025-11-18', 1),  
('2025-11-10', '2025-11-12', 3),  
('2025-11-16', '2025-11-20', 5),  
('2025-11-01', '2025-11-30', 7),  
('2025-12-01', '2025-12-10', 2);  

-- REQUETES SQL --
-- 1)
SELECT id, first_name, last_name 
FROM employee 
WHERE team_id IS NULL;

-- 2)
SELECT e.id, e.first_name, e.last_name 
FROM employee e
LEFT JOIN leave l 
ON e.id = l.employee_id
WHERE l.id IS NULL;

-- 3)
SELECT l.id AS leave_id, l.start_date, l.end_date, e.first_name, e.last_name, t.name AS team_name
FROM leave l
JOIN employee e ON l.employee_id = e.id
JOIN team t ON e.team_id = t.id;

-- 4)
SELECT contract_type, COUNT(*) AS employee_count
FROM employee
GROUP BY contract_type;

-- 5)
SELECT COUNT(*) AS employees_on_leave
FROM leave
WHERE start_date <= CURRENT_DATE
AND end_date >= CURRENT_DATE;

-- 6)
SELECT e.id, e.first_name, e.last_name, t.name AS team_name
FROM employee e
JOIN leave l ON l.employee_id = e.id
JOIN team t ON t.id = e.team_id
WHERE l.start_date <= CURRENT_DATE
AND l.end_date >= CURRENT_DATE;




