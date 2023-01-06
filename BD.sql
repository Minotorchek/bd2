create table if not exists genre (
	id SERIAL primary key, 
	genre VARCHAR(60) not null
);

create table if not exists performers (
	id SERIAL primary key,
	genre_id INTEGER not null references genre(id),
	name1 VARCHAR(60) not null
);

create table if not EXISTS interval1 (
	genre_id INTEGER REFERENCES genre(id),
	performers_id INTEGER REFERENCES performers(id),
	constraint y PRIMARY key (genre_id, performers_id) 
);

create table if not exists alboms (
	id SERIAL primary key,
	performers_id INTEGER not null references performers(id),
	name VARCHAR(60) not null,
	date1 DATE not null
);

create table if not EXISTS interval2 (
	performers_id INTEGER REFERENCES performers(id),
	performer_id INTEGER REFERENCES alboms(id),
	CONSTRAINT x PRIMARY KEY (performers_id, performer_id)
);

CREATE TABLE IF NOT EXISTS music (
	id SERIAL PRIMARY KEY,
	music VARCHAR(60) NOT NULL,
	albom_id INTEGER not null references alboms(id),
	duration time NOT NULL
);
	
create table if not exists compilations (
	id SERIAL PRIMARY KEY,
	CompilationName VARCHAR(60) not null,
	music INTEGER not null references music(id),
	albom INTEGER not null references alboms(id),
	date1 DATE not null
);

CREATE TABLE IF NOT EXISTS interval3 (
	music_id INTEGER REFERENCES music(id),
	compilations_id INTEGER REFERENCES compilations(id),
	albom_id INTEGER references alboms(id),
	CONSTRAINT z PRIMARY KEY (music_id, compilations_id,albom_id)
);











