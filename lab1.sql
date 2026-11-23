-- 1. Создаем таблицу "Дисциплины"
CREATE TABLE disciplines (
    discipline_code INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    year_introduced INTEGER NOT NULL
);

-- 2. Создаем таблицу "Расписание"
CREATE TABLE schedule (
    group_number VARCHAR(20) NOT NULL,
    lab_number VARCHAR(10) NOT NULL,
    discipline_code INTEGER NOT NULL,
    day_of_week VARCHAR(15) NOT NULL,
    lesson_number INTEGER NOT NULL,
    PRIMARY KEY (group_number, day_of_week, lesson_number),
    CONSTRAINT fk_schedule_discipline
        FOREIGN KEY (discipline_code)
        REFERENCES disciplines(discipline_code)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
