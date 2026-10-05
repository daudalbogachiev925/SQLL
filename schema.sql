CREATE TABLE events (
    id INTEGER PRIMARY KEY, user_id INT, event TEXT,
    page TEXT, ts DATETIME);
CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, signup DATE, plan TEXT);
