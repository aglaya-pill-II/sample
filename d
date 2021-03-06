PGDMP                           y            taxi_service    11.12    11.12 /    D           0    0    ENCODING    ENCODING         SET client_encoding = 'LATIN1';
                       false            E           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            F           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            G           1262    16393    taxi_service    DATABASE     ?   CREATE DATABASE taxi_service WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE taxi_service;
             postgres    false                        2615    24576    taxi    SCHEMA        CREATE SCHEMA taxi;
    DROP SCHEMA taxi;
             postgres    false            ?            1259    24626    call_worker    TABLE     *  CREATE TABLE taxi.call_worker (
    call_worker_id integer NOT NULL,
    call_worker_name character(70) NOT NULL,
    call_worker_adress character(70),
    call_worker_phone character(10) NOT NULL,
    call_worker_passport character(70) NOT NULL,
    call_worker_position character(10) NOT NULL
);
    DROP TABLE taxi.call_worker;
       taxi         postgres    false    7            ?            1259    24582    car    TABLE     ?   CREATE TABLE taxi.car (
    car_id integer NOT NULL,
    model_id integer NOT NULL,
    model character(30) NOT NULL,
    year_prod smallint,
    km integer NOT NULL,
    date_to date NOT NULL,
    car_num character(10) NOT NULL
);
    DROP TABLE taxi.car;
       taxi         postgres    false    7            ?            1259    24577    driver    TABLE     +  CREATE TABLE taxi.driver (
    driver_id integer NOT NULL,
    driver_name character(70) NOT NULL,
    driver_adress character(100),
    driver_phone character(10) NOT NULL,
    driver_passport character(70) NOT NULL,
    driver_position character(20) NOT NULL,
    driver_category character(10)
);
    DROP TABLE taxi.driver;
       taxi         postgres    false    7            ?            1259    24606    models    TABLE     ?   CREATE TABLE taxi.models (
    model_id integer NOT NULL,
    model_name character(20) NOT NULL,
    model_brand character(10) NOT NULL,
    tech_characteristics character(70) NOT NULL
);
    DROP TABLE taxi.models;
       taxi         postgres    false    7            ?            1259    24633 	   passenger    TABLE     ?   CREATE TABLE taxi.passenger (
    passanger_id integer NOT NULL,
    passanger_name character(70) NOT NULL,
    passanger_phone character(10) NOT NULL
);
    DROP TABLE taxi.passenger;
       taxi         postgres    false    7            ?            1259    24616    ride    TABLE     ?  CREATE TABLE taxi.ride (
    ride_id integer NOT NULL,
    car_id integer NOT NULL,
    call_worker_id integer NOT NULL,
    tarif_id integer NOT NULL,
    passanger_id integer NOT NULL,
    call_date date NOT NULL,
    time_begin time without time zone NOT NULL,
    time_end time without time zone NOT NULL,
    from_loc character(70) NOT NULL,
    to_loc character(70) NOT NULL,
    distance integer NOT NULL
);
    DROP TABLE taxi.ride;
       taxi         postgres    false    7            ?            1259    24591    schedule    TABLE     ?   CREATE TABLE taxi.schedule (
    shift_id integer NOT NULL,
    car_id integer NOT NULL,
    driver_id integer NOT NULL,
    shift_begin timestamp without time zone NOT NULL,
    shift_end timestamp without time zone NOT NULL
);
    DROP TABLE taxi.schedule;
       taxi         postgres    false    7            ?            1259    24646    tarif    TABLE     {   CREATE TABLE taxi.tarif (
    tarif_id integer NOT NULL,
    tarif_name character(10),
    tarif_price integer NOT NULL
);
    DROP TABLE taxi.tarif;
       taxi         postgres    false    7            ?          0    24626    call_worker 
   TABLE DATA               ?   COPY taxi.call_worker (call_worker_id, call_worker_name, call_worker_adress, call_worker_phone, call_worker_passport, call_worker_position) FROM stdin;
    taxi       postgres    false    202   ?8       ;          0    24582    car 
   TABLE DATA               U   COPY taxi.car (car_id, model_id, model, year_prod, km, date_to, car_num) FROM stdin;
    taxi       postgres    false    198   ?9       :          0    24577    driver 
   TABLE DATA               ?   COPY taxi.driver (driver_id, driver_name, driver_adress, driver_phone, driver_passport, driver_position, driver_category) FROM stdin;
    taxi       postgres    false    197   ?<       =          0    24606    models 
   TABLE DATA               W   COPY taxi.models (model_id, model_name, model_brand, tech_characteristics) FROM stdin;
    taxi       postgres    false    200   ?A       @          0    24633 	   passenger 
   TABLE DATA               P   COPY taxi.passenger (passanger_id, passanger_name, passanger_phone) FROM stdin;
    taxi       postgres    false    203   ?C       >          0    24616    ride 
   TABLE DATA               ?   COPY taxi.ride (ride_id, car_id, call_worker_id, tarif_id, passanger_id, call_date, time_begin, time_end, from_loc, to_loc, distance) FROM stdin;
    taxi       postgres    false    201   ?E       <          0    24591    schedule 
   TABLE DATA               U   COPY taxi.schedule (shift_id, car_id, driver_id, shift_begin, shift_end) FROM stdin;
    taxi       postgres    false    199   ?M       A          0    24646    tarif 
   TABLE DATA               @   COPY taxi.tarif (tarif_id, tarif_name, tarif_price) FROM stdin;
    taxi       postgres    false    204   ?N       ?
           2606    24630    call_worker call_worker_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY taxi.call_worker
    ADD CONSTRAINT call_worker_pkey PRIMARY KEY (call_worker_id);
 D   ALTER TABLE ONLY taxi.call_worker DROP CONSTRAINT call_worker_pkey;
       taxi         postgres    false    202            ?
           2606    24586 
   car car_id 
   CONSTRAINT     J   ALTER TABLE ONLY taxi.car
    ADD CONSTRAINT car_id PRIMARY KEY (car_id);
 2   ALTER TABLE ONLY taxi.car DROP CONSTRAINT car_id;
       taxi         postgres    false    198            ?
           2606    40995    schedule check_data_sch    CHECK CONSTRAINT     i   ALTER TABLE taxi.schedule
    ADD CONSTRAINT check_data_sch CHECK ((shift_begin < shift_end)) NOT VALID;
 :   ALTER TABLE taxi.schedule DROP CONSTRAINT check_data_sch;
       taxi       postgres    false    199    199    199    199            ?
           2606    40968    ride distance_not_zero    CHECK CONSTRAINT     ]   ALTER TABLE taxi.ride
    ADD CONSTRAINT distance_not_zero CHECK ((distance > 0)) NOT VALID;
 9   ALTER TABLE taxi.ride DROP CONSTRAINT distance_not_zero;
       taxi       postgres    false    201    201            ?
           2606    24581    driver driver_id 
   CONSTRAINT     S   ALTER TABLE ONLY taxi.driver
    ADD CONSTRAINT driver_id PRIMARY KEY (driver_id);
 8   ALTER TABLE ONLY taxi.driver DROP CONSTRAINT driver_id;
       taxi         postgres    false    197            ?
           2606    41001    car km_not_zero    CHECK CONSTRAINT     P   ALTER TABLE taxi.car
    ADD CONSTRAINT km_not_zero CHECK ((km > 0)) NOT VALID;
 2   ALTER TABLE taxi.car DROP CONSTRAINT km_not_zero;
       taxi       postgres    false    198    198            ?
           2606    24610    models models_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY taxi.models
    ADD CONSTRAINT models_pkey PRIMARY KEY (model_id);
 :   ALTER TABLE ONLY taxi.models DROP CONSTRAINT models_pkey;
       taxi         postgres    false    200            ?
           2606    24637    passenger passenger_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY taxi.passenger
    ADD CONSTRAINT passenger_pkey PRIMARY KEY (passanger_id);
 @   ALTER TABLE ONLY taxi.passenger DROP CONSTRAINT passenger_pkey;
       taxi         postgres    false    203            ?
           2606    40969    tarif price_not_zero    CHECK CONSTRAINT     ^   ALTER TABLE taxi.tarif
    ADD CONSTRAINT price_not_zero CHECK ((tarif_price > 0)) NOT VALID;
 7   ALTER TABLE taxi.tarif DROP CONSTRAINT price_not_zero;
       taxi       postgres    false    204    204            ?
           2606    24620    ride ride_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT ride_pkey PRIMARY KEY (ride_id);
 6   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT ride_pkey;
       taxi         postgres    false    201            ?
           2606    24595    schedule schedule_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY taxi.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (shift_id);
 >   ALTER TABLE ONLY taxi.schedule DROP CONSTRAINT schedule_pkey;
       taxi         postgres    false    199            ?
           2606    24588    driver unique_cols 
   CONSTRAINT     o   ALTER TABLE ONLY taxi.driver
    ADD CONSTRAINT unique_cols UNIQUE (driver_id, driver_phone, driver_passport);
 :   ALTER TABLE ONLY taxi.driver DROP CONSTRAINT unique_cols;
       taxi         postgres    false    197    197    197            ?
           2606    24641 !   call_worker unique_cols_call_work 
   CONSTRAINT     ?   ALTER TABLE ONLY taxi.call_worker
    ADD CONSTRAINT unique_cols_call_work UNIQUE (call_worker_id, call_worker_phone, call_worker_passport);
 I   ALTER TABLE ONLY taxi.call_worker DROP CONSTRAINT unique_cols_call_work;
       taxi         postgres    false    202    202    202            ?
           2606    40971    car unique_cols_cars 
   CONSTRAINT     X   ALTER TABLE ONLY taxi.car
    ADD CONSTRAINT unique_cols_cars UNIQUE (car_id, car_num);
 <   ALTER TABLE ONLY taxi.car DROP CONSTRAINT unique_cols_cars;
       taxi         postgres    false    198    198            ?
           2606    24643    models unique_models 
   CONSTRAINT     Q   ALTER TABLE ONLY taxi.models
    ADD CONSTRAINT unique_models UNIQUE (model_id);
 <   ALTER TABLE ONLY taxi.models DROP CONSTRAINT unique_models;
       taxi         postgres    false    200            ?
           2606    24639    passenger unique_passangers 
   CONSTRAINT     m   ALTER TABLE ONLY taxi.passenger
    ADD CONSTRAINT unique_passangers UNIQUE (passanger_id, passanger_phone);
 C   ALTER TABLE ONLY taxi.passenger DROP CONSTRAINT unique_passangers;
       taxi         postgres    false    203    203            ?
           2606    24652    ride unique_rides 
   CONSTRAINT     M   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT unique_rides UNIQUE (ride_id);
 9   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT unique_rides;
       taxi         postgres    false    201            ?
           2606    24645    schedule unique_shifts 
   CONSTRAINT     S   ALTER TABLE ONLY taxi.schedule
    ADD CONSTRAINT unique_shifts UNIQUE (shift_id);
 >   ALTER TABLE ONLY taxi.schedule DROP CONSTRAINT unique_shifts;
       taxi         postgres    false    199            ?
           2606    24650    tarif unique_tarifs 
   CONSTRAINT     U   ALTER TABLE ONLY taxi.tarif
    ADD CONSTRAINT unique_tarifs PRIMARY KEY (tarif_id);
 ;   ALTER TABLE ONLY taxi.tarif DROP CONSTRAINT unique_tarifs;
       taxi         postgres    false    204            ?
           2606    24653    ride call_worker    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT call_worker FOREIGN KEY (call_worker_id) REFERENCES taxi.call_worker(call_worker_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 8   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT call_worker;
       taxi       postgres    false    2737    202    201            ?
           2606    24596    schedule cars    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.schedule
    ADD CONSTRAINT cars FOREIGN KEY (car_id) REFERENCES taxi.car(car_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 5   ALTER TABLE ONLY taxi.schedule DROP CONSTRAINT cars;
       taxi       postgres    false    2721    199    198            ?
           2606    24621 	   ride cars    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT cars FOREIGN KEY (car_id) REFERENCES taxi.car(car_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 1   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT cars;
       taxi       postgres    false    198    201    2721            ?
           2606    24601    schedule drivers    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.schedule
    ADD CONSTRAINT drivers FOREIGN KEY (driver_id) REFERENCES taxi.driver(driver_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 8   ALTER TABLE ONLY taxi.schedule DROP CONSTRAINT drivers;
       taxi       postgres    false    199    197    2717            ?
           2606    24611 	   car model    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.car
    ADD CONSTRAINT model FOREIGN KEY (model_id) REFERENCES taxi.models(model_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 1   ALTER TABLE ONLY taxi.car DROP CONSTRAINT model;
       taxi       postgres    false    200    198    2729            ?
           2606    24663    ride passenger    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT passenger FOREIGN KEY (passanger_id) REFERENCES taxi.passenger(passanger_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 6   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT passenger;
       taxi       postgres    false    201    2741    203            ?
           2606    24658    ride tarifs    FK CONSTRAINT     ?   ALTER TABLE ONLY taxi.ride
    ADD CONSTRAINT tarifs FOREIGN KEY (tarif_id) REFERENCES taxi.tarif(tarif_id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;
 3   ALTER TABLE ONLY taxi.ride DROP CONSTRAINT tarifs;
       taxi       postgres    false    2745    204    201            ?   ?   1	Martynova Anna Victorovna                                             	\N	9786359811	4156 734678                                                           	call_work 
 ?   2	Mikhaylyk Elena Petrovna                                              	\N	9780091622	4156 398009                                                           	call_work 
    \.


      ;   C   1	5	Fortuner                      	2015	5000	2021-01-16	k228ek    
 C   2	2	Rio                           	2017	6054	2021-02-16	t262ed    
 C   3	1	Solaris                       	2018	4054	2021-01-26	s724jx    
 C   4	3	Duster                        	2019	5832	2021-03-09	x872nj    
 D   5	4	Sandero                       	2016	12083	2021-04-18	a624je    
 C   6	1	Solaris                       	2020	6083	2021-04-04	k835fr    
 E   7	2	Rio                           	2012	250001	2020-06-09	y543gf    
 D   8	5	Fortuner                      	2017	11001	2021-02-09	s287sy    
 D   9	3	Duster                        	2015	76001	2021-04-09	d726dy    
 E   10	4	Sandero                       	2016	54826	2021-03-24	g872ud    
    \.


      :   ?   1	Ivanov Ivan Ivanovich                                                 	\N	9786442334	4566 234566                                                           	driver              	B         
 ?   2	Sidorov Ivan Sidorovich                                               	\N	9782753467	4466 272377                                                           	driver              	B         
 ?   3	Radovich Mikhail Mikhailovich                                         	\N	9782590443	4166 560810                                                           	driver              	C         
 ?   4	Gavrov Mikhail Victorovich                                            	\N	9787000483	4166 341819                                                           	driver              	B         
 ?   5	Voronov Victor Petrovich                                              	\N	9793401148	4156 413920                                                           	driver              	B         
 ?   6	Frunov Petor Victorovich                                              	\N	9794018816	4156 1238765                                                          	driver              	C         
    \.


      =   i   1	Solaris             	Hyundai   	5, auto, 1.4                                                          
 i   2	Rio                 	Kia       	5, mech, 1.6                                                          
 i   3	Duster              	Renault   	5, auto, 1.6                                                          
 i   4	Sandero             	Renault   	5, auto, 1.6                                                          
 i   5	Fortuner            	Toyota    	5, auto, 2.7                                                          
    \.


      @   T   1	Victorova Alina Antonovna                                             	9129345921
 T   2	Antonov Anton Antonovich                                              	9219742476
 T   3	Antonova Anita Antonovna                                              	9212568105
 T   4	Vernov Alexey Vladisavovich                                           	9646295184
 T   5	Danilova Elizaveta Victorovna                                         	9985269140
    \.


      >   ?   1	1	1	3	2	2021-06-06	10:10:00	11:03:00	Lensoveta 23                                                          	Lomonosova 9                                                          	10
 ?   2	2	1	2	5	2021-06-07	16:10:00	17:03:00	Moskovskaya 21                                                        	Chkalova 9                                                            	15
 ?   3	2	1	2	4	2021-06-07	17:10:00	18:03:00	Chkalova 21                                                           	Nevskiy 66                                                            	20
 ?   4	2	1	2	3	2021-06-07	18:10:00	19:03:00	Nevskiy 86                                                            	Chkalova 1                                                            	22
 ?   5	1	1	3	2	2021-06-06	16:10:00	17:00:00	Lomonosova 9                                                          	Chkalova 18                                                           	23
 ?   6	1	1	3	2	2021-06-06	18:10:00	19:00:00	Ligovskiy 18                                                          	Lensoveta 23                                                          	13
 ?   7	1	1	3	1	2021-06-06	11:10:00	12:00:00	Nevskiy 18                                                            	Ligovskiy 23                                                          	3
 ?   8	5	2	1	1	2021-06-08	20:10:00	20:30:00	Nevskiy 88                                                            	Bolshaya Morskaya 23                                                  	3
 ?   9	5	2	1	3	2021-06-08	20:40:00	21:00:00	Bolshaya Morskaya 30                                                  	Moskovskiy prospect 100                                               	17
 ?   10	5	2	1	4	2021-06-08	21:10:00	21:00:00	Altayskaya 18                                                         	Nevskiy 66                                                            	20
 ?   11	5	2	1	5	2021-06-08	21:30:00	22:00:00	Ligovskiy 33                                                          	Petrogradskaya 30                                                     	11
    \.


      <   .   1	1	2	2021-06-06 08:05:00	2021-06-06 20:00:00
 .   2	2	1	2021-06-07 16:05:00	2021-06-08 02:00:00
 .   3	3	4	2021-06-07 08:05:00	2021-06-07 16:00:00
 .   4	4	5	2021-06-08 09:00:00	2021-06-08 19:00:00
 .   5	5	3	2021-06-08 20:00:00	2021-06-09 03:00:00
    \.


      A      1	econom    	90
    2	business  	150
    3	lux       	200
    \.


     