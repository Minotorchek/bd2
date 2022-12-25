create table if not exists genre (
	id SERIAL primary key, 
	genre VARCHAR(60) not null
);

create table if not exists performers (
	id SERIAL primary key,
	genre_id INTEGER not null references genre(id),
	name1 VARCHAR(60) not null
);

create table if not exists alboms (
	id SERIAL primary key,
	albom_id INTEGER not null references performers(id),
	date1 DATE not null
);

create table if not exists music (
	albom_id INTEGER references alboms(id),
	performers_id INTEGER references performers(id),
	constraint pk primary key (albom_id, performers_id)
);
	
create table if not exists compilations (
	albom_id INTEGER references alboms(id),
	performers_id INTEGER references performers(id),
	compilation VARCHAR(60) not null,
	date1 DATE not null
);
	