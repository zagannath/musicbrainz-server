SET client_min_messages TO 'WARNING';

INSERT INTO place_type (id, name) VALUES (1, 'Venue');
INSERT INTO place_type (id, name) VALUES (2, 'Studio');

INSERT INTO area_type (id, name) VALUES (1, 'Country');
INSERT INTO area (id, gid, name, sort_name, type) VALUES
  (221, '8a754a16-0027-3a29-b6d7-2b40ea0481ed', 'United Kingdom', 'United Kingdom', 1),
  (222, '489ce91b-6658-3307-9877-795b68554c98', 'United States', 'United States', 1);
INSERT INTO country_area (area) VALUES (221), (222);
INSERT INTO iso_3166_1 (area, code) VALUES (221, 'GB'), (222, 'US');

INSERT INTO place
    (id, gid, name, type, area, coordinates,
     begin_date_year, begin_date_month, begin_date_day,
     end_date_year, end_date_month, end_date_day, comment,
     last_updated, address)
    VALUES
    (1, '745c079d-374e-4436-9448-da92dedef3ce', 'Test Place', 1, 221,
     '(0.11,0.1)', 2008, 01, 02, 2009, 03, 04, 'Yet Another Test Place',
     '2009-07-09', 'An Address');

INSERT INTO place (id, gid, name)
       VALUES (2, '945c079d-374e-4436-9448-da92dedef3cf', 'Minimal Place');

INSERT INTO annotation (id, editor, text) VALUES (1, 1, 'Test annotation 1');
INSERT INTO annotation (id, editor, text) VALUES (2, 1, 'Test annotation 2');

INSERT INTO place_annotation (place, annotation) VALUES (1, 1);
INSERT INTO place_annotation (place, annotation) VALUES (2, 2);

INSERT INTO place_gid_redirect VALUES ('a4ef1d08-962e-4dd6-ae14-e42a6a97fc11', 1);

ALTER SEQUENCE place_id_seq RESTART 3;
ALTER SEQUENCE annotation_id_seq RESTART 3;
