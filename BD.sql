create table if not exists genre (
	id SERIAL primary key, 
	genre VARCHAR(60) not null
);

create table if not exists performers (
	id SERIAL primary key,
	name1 VARCHAR(60) not null
);

create table if not EXISTS interval1 (
	genre_id INTEGER REFERENCES genre(id),
	performers_id INTEGER REFERENCES performers(id),
	constraint y PRIMARY key (genre_id, performers_id) 
);

create table if not exists alboms (
	id SERIAL primary key,
	name VARCHAR(60) not null,
	date1 DATE not null
);

create table if not EXISTS interval2 (
	performers_id INTEGER REFERENCES performers(id),
	albom_id INTEGER REFERENCES alboms(id),
	CONSTRAINT x PRIMARY KEY (performers_id, albom_id)
);

CREATE TABLE IF NOT EXISTS music (
	id SERIAL PRIMARY KEY,
	music VARCHAR(60) NOT NULL,
	duration integer NOT NULL
);
	
create table if not exists compilations (
	id SERIAL PRIMARY KEY,
	CompilationName VARCHAR(60) not null,
	date1 DATE not null
);

CREATE TABLE IF NOT EXISTS interval3 (
	music_id INTEGER REFERENCES music(id),
	compilations_id INTEGER REFERENCES compilations(id),
	CONSTRAINT z PRIMARY KEY (music_id, compilations_id)
);

drop table compilations;






