
-- Script was generated by Devart dbForge Data Generator for MySQL, Version 2.2.33.0
-- Product Home Page: http://www.devart.com/dbforge/mysql/data-generator
-- Script date 06/09/2019 01:11:32
-- Target server version: 8.0.16
-- Target connection string: User Id=root;Host=localhost;Database=argus;Character Set=AUTO
--
SET NAMES 'utf8';
SET CHARACTER SET 'utf8';
USE argus;

--
-- Inserting data into table curriculo
--
INSERT INTO curriculo(codCurriculo, anoLetivo, Nome, Tipo) VALUES
('EFI', 2019, 'Ensino Fundamental Inicial', 'Bimestral');

--
-- Inserting data into table disciplinas
--
INSERT INTO disciplinas(codDisciplina, Nome, Status) VALUES
('POR', 'Português', 'Ativo'),
('MAT', 'Matemática', 'Ativo'),
('GEO', 'Geografia', 'Ativo'),
('HIS', 'História', 'Ativo'),
('CIE', 'Ciências', 'Ativo'),
('MUS', 'Música', 'Ativo'),
('EDF', 'Educação Física', 'Ativo'),
('ING', 'Inglês', 'Ativo'),
('ART', 'Artes', 'Ativo'),
('EXC', 'Expressão Corporal', 'Ativo');

--
-- Inserting data into table `curriculo-disciplina`
--
INSERT INTO `curriculo-disciplina`(codCurriculo, codDisciplina, ano, anoLetivo, cargaHoraria) VALUES
('EFI', 'MAT', 5, 2019, 245),
('EFI', 'HIS', 1, 2019, 161),
('EFI', 'ING', 2, 2019, 251),
('EFI', 'POR', 1, 2019, 186),
('EFI', 'ING', 3, 2019, 254),
('EFI', 'GEO', 5, 2019, 186),
('EFI', 'CIE', 5, 2019, 100),
('EFI', 'ING', 5, 2019, 78),
('EFI', 'EDF', 5, 2019, 194),
('EFI', 'MUS', 3, 2019, 257),
('EFI', 'MUS', 2, 2019, 258),
('EFI', 'HIS', 2, 2019, 44),
('EFI', 'EXC', 5, 2019, 121),
('EFI', 'POR', 2, 2019, 83),
('EFI', 'GEO', 2, 2019, 138),
('EFI', 'HIS', 5, 2019, 40),
('EFI', 'CIE', 2, 2019, 45),
('EFI', 'MAT', 4, 2019, 77),
('EFI', 'MUS', 5, 2019, 57),
('EFI', 'ART', 3, 2019, 125),
('EFI', 'HIS', 3, 2019, 237),
('EFI', 'ING', 4, 2019, 283),
('EFI', 'GEO', 1, 2019, 166),
('EFI', 'EDF', 2, 2019, 127),
('EFI', 'CIE', 1, 2019, 124),
('EFI', 'ART', 2, 2019, 67),
('EFI', 'POR', 3, 2019, 197),
('EFI', 'GEO', 3, 2019, 289),
('EFI', 'CIE', 3, 2019, 211),
('EFI', 'EXC', 3, 2019, 119),
('EFI', 'POR', 5, 2019, 112),
('EFI', 'EDF', 1, 2019, 96),
('EFI', 'ART', 4, 2019, 261),
('EFI', 'HIS', 4, 2019, 109),
('EFI', 'EDF', 3, 2019, 259),
('EFI', 'EXC', 4, 2019, 139),
('EFI', 'MAT', 2, 2019, 192),
('EFI', 'EXC', 2, 2019, 166),
('EFI', 'ART', 1, 2019, 192),
('EFI', 'POR', 4, 2019, 138),
('EFI', 'GEO', 4, 2019, 49),
('EFI', 'MAT', 3, 2019, 97),
('EFI', 'MUS', 4, 2019, 241),
('EFI', 'MAT', 1, 2019, 83),
('EFI', 'CIE', 4, 2019, 64),
('EFI', 'ART', 5, 2019, 130),
('EFI', 'EDF', 4, 2019, 211),
('EFI', 'EXC', 1, 2019, 54),
('EFI', 'ING', 1, 2019, 135),
('EFI', 'MUS', 1, 2019, 160);

--
-- Inserting data into table pessoas
--
INSERT INTO pessoas(codPessoa, Nome, Naturalidade, Dt_nascimento, CPF, Status) VALUES
(2, 'Michael Johnson', 'Zuni', '1970-03-30', '568.474.734-18', 'Ativo'),
(3, 'Kina Abraham', 'Pahrump', '2006-04-02', '024.391.304-34', 'Ativo'),
(4, 'Alexis Laflamme', 'Glen Haven', '2002-10-11', '085.643.486-21', 'Ativo'),
(5, 'Julienne Baxley', 'Rowley', '2015-09-13', NULL, 'Ativo'),
(6, 'Adolfo Bergeron', 'Houma', '2001-10-03', '653.359.505-61', 'Ativo'),
(7, 'Garry Metzger', 'Dresden', '2015-04-02', NULL, 'Ativo'),
(8, 'Cathrine Southerland', 'Paia', '1983-07-17', '071.000.448-85', 'Ativo'),
(9, 'Emely Shull', 'Glen Head', '2015-03-24', NULL, 'Ativo'),
(10, 'Charlsie Alston', 'Roxboro', '2015-09-27', NULL, 'Ativo'),
(11, 'Yevette Vanwinkle', 'Soquel', '1978-02-03', '743.385.760-54', 'Ativo'),
(12, 'Roxy Julian', 'Dresher', '1995-02-20', '394.744.976-96', 'Ativo'),
(13, 'Casey Pleasant', 'Lonsdale', '2015-03-23', NULL, 'Ativo'),
(14, 'Jefferey Abrams', 'Paicines', '1952-12-08', '339.878.364-77', 'Ativo'),
(15, 'Raymundo Bottoms', 'Glen Mills', '1949-04-10', '781.872.878-57', 'Ativo'),
(16, 'Sophia Driscoll', 'Roxbury', '2001-01-01', '210.966.183-06', 'Ativo'),
(17, 'Dave Browder', 'Housatonic', '2015-09-08', NULL, 'Ativo'),
(18, 'Randee Quinonez', 'Painesville', '2003-07-25', '756.530.267-07', 'Ativo'),
(19, 'Terrell Fryer', 'Roy', '2004-11-21', NULL, 'Ativo'),
(20, 'Nicola Neil', 'Loogootee', '2015-03-16', NULL, 'Ativo'),
(21, 'Earleen Sessions', 'Waialua', '2015-08-06', NULL, 'Ativo'),
(22, 'Daniele Hundley', 'Birchwood', '2001-01-04', '148.036.734-79', 'Ativo'),
(23, 'Lucrecia Cason', 'Dresser', '1986-02-20', '022.043.228-96', 'Ativo'),
(24, 'Adeline Abraham', 'Cobb', '1949-01-05', '464.230.396-53', 'Ativo'),
(25, 'Tresa Mallory', 'Sorrento', '2015-06-14', NULL, 'Ativo'),
(26, 'Timika Leger', 'Waianae', '2002-07-31', '443.687.271-93', 'Ativo'),
(27, 'Curt Munoz', 'Bird City', '2001-01-05', '581.791.771-60', 'Ativo'),
(28, 'Angelika Hinkle', 'Cobden', '2002-03-30', '886.136.549-08', 'Ativo'),
(29, 'Bradford Meza', 'Glen Oaks', '1986-11-04', '916.413.798-53', 'Ativo'),
(30, 'Cordie Acker', 'Bird Island', '2002-06-15', '143.080.561-04', 'Ativo'),
(31, 'Mickey Brubaker', 'Drexel', '1979-10-21', '689.326.279-36', 'Ativo'),
(32, 'Neville Triplett', 'Glen Riddle Lima', '1949-04-25', '509.692.909-29', 'Ativo'),
(33, 'Agripina Mcclendon', 'Drexel Hill', '1949-03-20', '174.392.340-84', 'Ativo'),
(34, 'Maxie Parnell', 'Soso', '1986-01-02', '542.982.023-74', 'Ativo'),
(35, 'Hue Reece', 'Glen Ridge', '2015-12-02', NULL, 'Ativo'),
(36, 'Fay Matson', 'House Springs', '1950-10-19', '545.947.609-11', 'Ativo'),
(37, 'Emiko Colbert', 'Paint Rock', '1974-10-28', '639.181.206-57', 'Ativo'),
(38, 'Alphonso Artis', 'Driftwood', '2002-04-20', '316.138.357-58', 'Ativo'),
(39, 'Vernon Tibbs', 'Royal Center', '2003-01-25', '720.362.941-10', 'Ativo'),
(40, 'Abby Webster', 'Glen Rock', '2002-02-20', '575.308.048-59', 'Ativo'),
(41, 'Tosha Fischer', 'Waikoloa', '2015-11-01', NULL, 'Ativo'),
(42, 'Versie Andrade', 'Cobleskill', '2001-01-08', '001.881.785-61', 'Ativo'),
(43, 'Alisa Almeida', 'Driggs', '1949-01-04', '834.419.442-87', 'Ativo'),
(44, 'Terrence Hazel', 'Birdsboro', '1967-09-29', '927.916.952-51', 'Ativo'),
(45, 'Jenelle Woodard', 'Souderton', '2014-04-09', '889.459.073-36', 'Ativo'),
(46, 'Alva Westfall', 'Painted Post', '2001-01-09', '882.217.502-31', 'Ativo'),
(47, 'Adah Caballero', 'Royal City', '1953-10-30', '203.913.421-14', 'Ativo'),
(48, 'Ramona Correia', 'Lookeba', '2003-11-12', '369.565.380-87', 'Ativo'),
(49, 'Paige Welsh', 'Painter', '2014-10-13', '719.597.736-05', 'Ativo'),
(50, 'Kevin Stephen', 'Glen Rose', '1949-01-05', '785.086.799-41', 'Ativo'),
(51, 'Camie Cosgrove', 'Houston', '1955-09-29', '286.499.719-19', 'Ativo'),
(52, 'Gale Elliott', 'Eleva', '1970-03-30', '318.317.425-35', 'Ativo'),
(53, 'Damien Gibbs', 'Lonoke', '2006-04-02', '508.244.707-97', 'Ativo'),
(54, 'Kareem Culver', 'Zuni', '2002-10-11', '557.654.053-40', 'Ativo'),
(55, 'Houston Contreras', 'Porterville', '2006-09-13', '399.049.427-93', 'Ativo'),
(56, 'Alonzo Calvin', 'Houma', '2001-10-03', '304.892.871-27', 'Ativo'),
(57, 'Trudie Abney', 'Block Island', '2003-04-02', '079.920.591-94', 'Ativo'),
(58, 'Alane Patrick', 'Lonsdale', '1983-07-17', '687.090.333-66', 'Ativo'),
(59, 'Berry Pedersen', 'Hackettstown', '2006-03-24', '312.297.967-54', 'Ativo'),
(60, 'Maria Abney', 'Coloma', '2006-09-27', '641.656.173-92', 'Ativo'),
(61, 'Joette Valdez', 'Elfers', '1978-02-03', '634.155.570-67', 'Ativo'),
(62, 'Adah Ambrose', 'Haddam', '1995-02-20', '570.285.022-43', 'Ativo'),
(63, 'Thresa Park', 'Blomkest', '2014-03-23', '005.018.687-36', 'Ativo'),
(64, 'Bryant Blanchard', 'Elgin', '1952-12-08', '763.479.395-36', 'Ativo'),
(65, 'Alexis Mallory', 'Colome', '1949-04-10', '967.321.760-94', 'Ativo'),
(66, 'Alida Dover', 'Haddon Heights', '2001-01-01', '554.393.961-66', 'Ativo'),
(67, 'Alane Alves', 'Newburg', '2006-09-08', '048.075.712-28', 'Ativo'),
(68, 'Steven Lombard', 'Porthill', '2003-07-25', '755.629.736-58', 'Ativo'),
(69, 'Amina Hickman', 'Elida', '2004-11-21', '828.560.417-42', 'Ativo'),
(70, 'Moises Kellogg', 'Williams', '2014-03-16', '112.632.066-50', 'Ativo'),
(71, 'Orlando Rich', 'Housatonic', '2002-08-06', '822.899.574-95', 'Ativo'),
(72, 'Lakenya Godfrey', 'Loogootee', '2001-01-04', '720.567.839-02', 'Ativo'),
(73, 'Norma Forrester', 'Bloomdale', '1986-02-20', '000.176.220-18', 'Ativo'),
(74, 'Edmond Pollock', 'Suttons Bay', '1949-01-05', '412.900.638-31', 'Ativo'),
(75, 'Roderick Mims', 'Haddonfield', '2014-06-14', '973.663.468-10', 'Ativo'),
(76, 'Foster Cantwell', 'House Springs', '2002-07-31', '587.011.378-61', 'Ativo'),
(77, 'Cletus Rosado', 'Williams Bay', '2001-01-05', '383.492.194-34', 'Ativo'),
(78, 'Alina Buckner', 'Colon', '2002-03-30', '200.249.417-01', 'Ativo'),
(79, 'Eusebio Truong', 'Newburgh', '1986-11-04', '850.106.401-74', 'Ativo'),
(80, 'Gay Maples', 'Lookeba', '2002-06-15', '534.440.603-52', 'Ativo'),
(81, 'Verena Allred', 'Bloomer', '1979-10-21', '914.828.762-20', 'Ativo'),
(82, 'Shaina Crouse', 'Houston', '1949-04-25', '611.256.119-59', 'Ativo'),
(83, 'Mirtha Mcginnis', 'Eliot', '1949-03-20', '609.953.209-07', 'Ativo'),
(84, 'Fermin Amaya', 'Portland', '1986-01-02', '682.826.086-50', 'Ativo'),
(85, 'Adaline Alston', 'Colonia', '2014-12-02', '462.419.901-65', 'Ativo'),
(86, 'Andy Cowart', 'Bloomfield', '1950-10-19', '226.570.464-82', 'Ativo'),
(87, 'Jarrod Abraham', 'Colonial Beach', '1974-10-28', '858.176.670-85', 'Ativo'),
(88, 'Benita Morin', 'Bloomfield Hills', '2002-04-20', '343.494.898-48', 'Ativo'),
(89, 'Gerald Kinder', 'Newbury', '2003-01-25', '904.619.869-34', 'Ativo'),
(90, 'Cynthia Butterfield', 'Portola', '2002-02-20', '750.274.633-30', 'Ativo'),
(91, 'Dexter Burt', 'Colonial Heights', '2005-11-01', '731.999.341-30', 'Ativo'),
(92, 'Gregory Dodge', 'Suwanee', '2015-01-08', NULL, 'Ativo'),
(93, 'Tessie Alba', 'Newbury Park', '1949-01-04', '484.100.515-39', 'Ativo'),
(94, 'Pandora Lindgren', 'Portola Valley', '1967-09-29', '653.516.412-65', 'Ativo'),
(95, 'Alva Batten', 'Newburyport', '2001-04-09', '779.031.017-15', 'Ativo'),
(96, 'Antonia Langford', 'Lookout', '2001-01-09', '535.540.136-31', 'Ativo'),
(97, 'Darleen Bratcher', 'Houtzdale', '1953-10-30', '097.963.451-24', 'Ativo'),
(98, 'Stanley Anderson', 'Hadley', '2003-11-12', '612.620.363-33', 'Ativo'),
(99, 'Clarence Abbott', 'Elizabeth', '2004-10-13', '906.058.179-07', 'Ativo'),
(100, 'Clint Merriman', 'Lookout Mountain', '1949-01-05', '856.487.469-50', 'Ativo'),
(101, 'Johnson Carl', 'Hagerman', '2015-09-29', NULL, 'Ativo');
--
-- Inserting data into table contatos
--
INSERT INTO contatos(codPessoa, Telefone, Celular, Email, whatsapp) VALUES
(1, '(87)3831-8065', '(87)99638-3573', NULL, 1),
(15, '353-5572', '07624803317', NULL, 0),
(37, '616-9947', '07624169351', 'Whitman9@example.com', 1),
(4, '522-4615', '07624874175', 'Lutz438@nowhere.com', 1),
(43, '755-7107', '07624899137', 'RegaladoO@example.com', 0),
(38, '819-2339', '07624322612', 'Hyman@example.com', 1),
(51, '329-7457', '07489326554', 'KareemBinkley@example.com', 0),
(46, '199-0109', '07743451746', 'Eda_Mallory577@example.com', 1),
(44, '210-9996', '07624556610', 'RicardaNAndre@example.com', 1),
(16, '252-2063', '07624681138', 'BannisterO485@example.com', 0),
(47, NULL, '07624205787', 'MauricePepper949@example.com', 1),
(39, '820-8663', '07624555456', 'Fay.Andres@example.com', 0),
(22, '130-5414', '07946966534', NULL, 1),
(50, '446-3801', '07414807942', 'jmcqy5@example.com', 0),
(28, NULL, '07624509212', NULL, 1),
(11, '459-9752', '07892768299', 'Acevedo733@example.com', 1),
(34, '994-4885', '07955118704', 'Abreu@example.com', 0),
(48, '929-2660', '07624477691', 'Moeller@example.com', 0),
(29, '260-1808', '07750664570', 'Acker@example.com', 0),
(6, '776-1259', '07624368702', 'ElissaJacobs@example.com', 1),
(24, '917-9051', '07979281006', 'rxrisnix_pmwl@nowhere.com', 1),
(30, '676-0646', '07624505020', 'gmfyejp7@example.com', 0),
(23, '255-7135', '07910493786', 'FallonLane@example.com', 0),
(18, '817-6388', '07548756031', 'Alvin.Hahn@example.com', 1),
(40, '789-7791', '07737527359', 'bfpu4@example.com', 1),
(12, '942-6880', '07826765929', 'ElijahAbney@example.com', 0),
(2, '164-5886', '07586965071', NULL, 1),
(19, '897-2397', '07624693736', 'IlonaAshmore@example.com', 0),
(14, '227-5278', '07624238019', 'Valentin@nowhere.com', 0),
(31, '832-2704', '07624361530', 'ylffg9891@example.com', 1),
(8, '708-4044', '07490566384', 'Keith29@nowhere.com', 1),
(3, '881-6586', '07624194349', 'Acker@example.com', 1),
(26, '975-1279', '07624957791', 'xrysmi3@example.com', 1),
(36, '092-6323', '07624038553', 'LaddT@nowhere.com', 0),
(42, '809-2267', '07890907502', NULL, 1),
(32, '043-5913', '07624932601', 'CurtisBTrimble2@example.com', 0),
(27, '235-9468', '07785299994', NULL, 1),
(33, '347-3774', '07741851475', 'IgnacioEllington43@example.com', 1),
(65, '(69)9496-8271', '(49)97687-8343', NULL, 0),
(87, '(12)3571-3357', '(79)97551-8616', 'Whitman9@example.com', 1),
(71, NULL, '(17)93157-8164', 'Stacey85@nowhere.com', 0),
(54, '(87)7999-2796', '(13)95516-7684', 'Lutz438@nowhere.com', 1),
(93, '(95)7457-7392', '(12)93371-9475', 'RegaladoO@example.com', 0),
(88, '(41)3108-0542', '(61)92661-1042', 'Hyman@example.com', 1),
(101, '(19)1869-2249', '(63)95025-5660', 'KareemBinkley@example.com', 0),
(96, '(13)7505-4599', '(46)95521-0234', 'Eda_Mallory577@example.com', 1),
(99, '(64)0428-2236', '(53)97620-1026', 'AguiarP@nowhere.com', 0),
(94, '(23)1963-2114', '(12)94175-9049', 'RicardaNAndre@example.com', 1),
(66, '(44)2053-1405', '(18)96396-7062', 'BannisterO485@example.com', 0),
(97, NULL, '(56)92885-5570', 'MauricePepper949@example.com', 1),
(89, '(32)0815-6379', '(53)92343-7061', 'Fay.Andres@example.com', 0),
(72, '(39)9174-2527', '(61)91517-7417', NULL, 1),
(60, '(21)7307-5158', '(66)92619-8387', 'Wade.H.Marx722@example.com', 1),
(55, '(42)8147-0750', '(81)92042-8927', 'zajvyfes_gigpanbvkz@example.com', 0),
(100, '(42)6044-0106', '(18)96582-9050', 'jmcqy5@example.com', 0),
(78, NULL, '(74)98901-6863', NULL, 1),
(61, '(84)6553-1358', '(78)91193-4711', 'Acevedo733@example.com', 1),
(84, '(13)2602-6230', '(33)96366-2618', 'Abreu@example.com', 0),
(98, '(29)8375-1871', '(18)91734-2994', 'Moeller@example.com', 0),
(79, '(32)5632-0796', '(12)99462-4632', 'Acker@example.com', 0),
(56, '(56)6393-2823', '(46)99649-5346', 'ElissaJacobs@example.com', 1),
(95, '(93)4809-6135', '(78)98090-9050', NULL, 1),
(67, '(63)5751-0109', '(18)90649-2240', NULL, 0),
(74, '(94)1273-3792', '(55)90321-7365', 'rxrisnix_pmwl@nowhere.com', 1),
(80, '(78)4490-0021', '(55)97655-7877', 'gmfyejp7@example.com', 0),
(73, '(86)4091-2255', '(59)93129-9947', 'FallonLane@example.com', 0),
(68, '(95)3941-6026', '(35)93639-5425', 'Alvin.Hahn@example.com', 1),
(90, '(57)2632-1722', '(78)92841-7297', 'bfpu4@example.com', 1),
(62, '(39)3936-1921', '(13)95574-4612', 'ElijahAbney@example.com', 0),
(57, '(87)7279-5889', '(64)99210-6035', 'Marchand@example.com', 0),
(52, '(91)4896-4737', '(73)91816-4646', 'MasonM_Cortes145@nowhere.com', 1),
(91, NULL, '(46)90155-3882', 'IlonaAshmore@example.com', 0),
(69, '(25)1605-8305', '(29)91672-3378', 'Valentin@nowhere.com', 0),
(64, '(48)3022-4611', '(64)98570-0380', 'ylffg9891@example.com', 0),
(81, '(93)8034-7465', '(68)91728-9777', 'Keith29@nowhere.com', 1),
(58, '(28)8996-2986', '(61)91659-9624', 'Acker@example.com', 1),
(53, '(29)6793-9890', '(52)95435-8269', 'Abrams29@example.com', 1),
(59, '(92)5116-2694', '(47)93495-3079', 'xrysmi3@example.com', 1),
(76, '(84)6410-9678', '(66)91734-1892', 'LaddT@nowhere.com', 1),
(86, '(94)0489-7713', '(38)98938-5446', 'CurtisBTrimble2@example.com', 0),
(82, '(14)8302-4615', '(98)96628-3899', 'Forsythe@nowhere.com', 0),
(77, '(61)6668-0857', '(67)91722-7826', 'Toby.Dellinger@example.com', 1),
(83, NULL, '(83)96723-4305', 'ScottyNavarro6@example.com', 1);

--
-- Inserting data into table enderecos
--
INSERT INTO enderecos(codPessoa, Rua, Numero, Complemento, Bairro, Cidade, Estado) VALUES
(1, 'Erenita julia magalhes', 2, 'Quadra 10 Lote 02', 'Mutirao', 'Serra Talhada', 'Pernambuco'),
(17, '99 NE Sharp Hill Parkway', 65, '4th FL', 'Newkirk', 'Stinson Beach', 'Wisconsin'),
(23, '2470 N Lake Dr', 22, '63th FL', 'Zuni', 'Datil', 'Kentucky'),
(51, '85 NW Buttonwood Street', '19', '43th Floor', 'Kenduskeag', 'Mousie', 'Colorado'),
(46, '59 W Stonewood Ln', 07, '61th FL', 'Mazeppa', 'North Arlington', 'Maryland'),
(18, '82 Ironwood Street', 23, '9th Floor', 'Bellmore', 'Lincolnton', 'Wyoming'),
(4, '473 Parkwood Lane', 42, '7th FL', 'Choteau', 'Continental', 'Mississippi'),
(49, '384 Glenwood Hwy', 97, '87th Floor', 'Bellows Falls', 'Bonduel', 'Hawaii'),
(10, '668 2nd Lane', 27, '6th FL', 'Kenedy', 'Ft Davis', 'Missouri'),
(13, '2165 White Stonewood Loop', '72', '58th FL', 'Mazomanie', 'Moville', 'Tennessee'),
(5, '856 Market Blvd', 30, '61th FL', 'Potlatch', 'Lincolnville', 'Arizona'),
(38, '2691 Oak Ct', 84, '8th FL', 'Fairless Hills', 'Dauphin', 'Nebraska'),
(11, '505 Chapel Hill Ave', 03, '4th FL', 'Newland', 'Ft Defiance', 'Texas'),
(47, '92 Old Brentwood Ct', 12, '5th FL', 'Wappingers Falls', 'Contoocook', 'Ohio'),
(27, '3246 N Rockwood Blvd', 08, '89th Floor', 'South Thomaston', 'Prue', 'Nevada'),
(33, '725 Waterview Highway', 70, 'Enquirer Bldg', 'Chouteau', 'Moweaqua', 'Texas'),
(44, '3886 NW Oak Ln', 55, '69th Floor', 'Bellport', 'Zuni', 'North Carolina'),
(28, '497 Lake Way', 22, '78th FL', 'Wapwallopen', 'Dauphin Island', 'Ohio'),
(34, '2363 Buttonwood Court', 57, '8th Floor', 'South Wales', 'Lincolnwood', 'Colorado'),
(39, '830 S Prospect Hill Parkway', 13, '58th FL', 'Heislerville', 'Mower County', 'Alaska'),
(6, '1562 2nd Lane', 98, '85th FL', 'Chowchilla', 'Bondurant', 'Arizona'),
(50, '2485 West Mount Circle', 58, '8th Floor', 'Fairmont', 'West Pawlet', 'Delaware'),
(48, '3670 Oak Rd', 32, '89th Floor', 'Potomac', 'Convent', 'Georgia'),
(45, '1318 SE Buttonwood Street', 88, '6th FL', 'Newman', 'Ft Deposit', 'North Carolina'),
(12, '642 E Town Ct', 99, '86th Floor', 'Potosi', 'Davenport', 'New Mexico'),
(29, '197 SE Rose Hill Ln', 87, '6th FL', 'Newman Grove', 'North Attleboro', 'Illinois'),
(7, '2154 Rock Hill Circle', 51, NULL, 'Ward', 'Ft Dodge', 'Vermont'),
(2, '286 Sharp Hill Loop', 68, '59th Floor', 'Kenilworth', 'Bonesteel', 'Mississippi'),
(24, '569 Pine Tree Street', 73, NULL, 'Helen', 'David City', 'Montana'),
(30, '253 Ski Hill Ave', 20, '8th Floor', 'Fairmount', 'Lincroft', 'North Carolina'),
(19, '2344 Beachwood Pkwy', 62, '66th Floor', 'Helena', 'Ft Drum', 'Texas'),
(25, '213 Burwood Ct', 70, '79th Floor', 'Bells', 'Pryor', 'Florida'),
(40, '1486 W Prospect Hill Ct', 29, '72th FL', 'Potsdam', 'Stirling', 'Idaho'),
(8, '3302 Mountain Way', 37, '72th FL', 'Fairplay', 'West Plains', 'Washington'),
(31, '2802 New Ski Hill Hwy', 92, '9th FL', 'Chrisman', 'Stockbridge', 'Ohio'),
(26, '2605 Prospect Hill Dr', 75, '70th FL', 'Helendale', 'North Augusta', 'California'),
(14, '942 SW Glenwood Circle', 84, '76th Floor', 'Mc Afee', 'West Point', 'Georgia'),
(32, '649 Old Social Lane', 40, 'Standard Bldg', 'South Walpole', 'Davidson', 'Tennessee'),
(20, '910 Front Drive', 72, '6th FL', 'Fairport', 'Moxee', 'Wisconsin'),
(15, '2982 SW Riddle Hill Lane', 91, '9th Floor', 'Wardell', 'Stockdale', 'Alaska'),
(35, '13 E Town Street', 67, '9th Floor', 'Bellville', 'Lind', 'New Jersey'),
(41, '3713 Bayview Ct', 33, '9th Floor', 'Kenmare', 'Pueblo', 'Georgia'),
(3, '123 E Chapel Hill Ct', 28, '6th FL', 'South Wayne', 'Ft Duchesne', 'Arizona'),
(36, '2083 Ironwood Ct', 59, '59th Floor', 'Helenville', 'Davidsonville', 'Delaware'),
(21, '2714 Beachwood Way', 46, 'Kearns Building', 'Newman Lake', 'Converse', 'Mississippi'),
(42, '60 East Hazelwood Dr', 20, '9th FL', 'Warden', 'Bonham', 'Utah'),
(16, '241 Old Beachwood Parkway', 93, NULL, 'Mc Arthur', 'Moyock', 'Vermont'),
(37, '2710 Stonewood Road', 89, '8th FL', 'Fairview', 'North Aurora', 'Oregon'),
(22, '1512 White Oak Blvd', 58, '5th FL', 'Christiana', 'Lindale', 'Montana'),
(9, '554 Sharp Hill Parkway', 41, NULL, 'Helenwood', 'West Portsmouth', 'Florida'),
(43, '38 S Ashwood Ct', 48, NULL, 'Fairview Heights', 'Conway', 'Delaware'),
(67, '71 Hunting Hill Ln', 54, '4th FL', 'Newkirk', 'Stinson Beach', 'Wisconsin'),
(73, '729 Bayview Pkwy', 85, '63th FL', 'Zuni', 'Datil', 'Kentucky'),
(101, '48 Monument Ave', 121, '43th Floor', 'Kenduskeag', 'Mousie', 'Colorado'),
(96, '1331 Red Rock Hill Loop', 26, '61th FL', 'Mazeppa', 'North Arlington', 'Maryland'),
(68, '75 East Front Ln', 192, '9th Floor', 'Bellmore', 'Lincolnton', 'Wyoming'),
(54, '71 W Deepwood Lane', 63, '7th FL', 'Choteau', 'Continental', 'Mississippi'),
(99, '114 Market Ln', 88, '87th Floor', 'Bellows Falls', 'Bonduel', 'Hawaii'),
(60, '2538 1st Parkway', 189, '6th FL', 'Kenedy', 'Ft Davis', 'Missouri'),
(63, '1166 Old Fox Hill Rd', 50, '58th FL', 'Mazomanie', 'Moville', 'Tennessee'),
(55, '17 East Buttonwood Pkwy', 42, '61th FL', 'Potlatch', 'Lincolnville', 'Arizona'),
(88, '133 Church Loop', 179, '8th FL', 'Fairless Hills', 'Dauphin', 'Nebraska'),
(61, '446 Red Beachwood Way', 108, '4th FL', 'Newland', 'Ft Defiance', 'Texas'),
(97, '3588 Rose Hill Parkway', 97, '5th FL', 'Wappingers Falls', 'Contoocook', 'Ohio'),
(77, '1151 Cedar Tree Ct', 22, '89th Floor', 'South Thomaston', 'Prue', 'Nevada'),
(83, '510 Meadowview St', 135, 'Enquirer Bldg', 'Chouteau', 'Moweaqua', 'Texas'),
(94, '898 South Beachwood Circle', 177, '69th Floor', 'Bellport', 'Zuni', 'North Carolina'),
(78, '24 Riverside Pkwy', 36, '78th FL', 'Wapwallopen', 'Dauphin Island', 'Ohio'),
(84, '222 Waterview Ct', 12, '8th Floor', 'South Wales', 'Lincolnwood', 'Colorado'),
(89, '1807 NE Pine Tree Ct', 83, '58th FL', 'Heislerville', 'Mower County', 'Alaska'),
(56, '244 White Social Parkway', 24, '85th FL', 'Chowchilla', 'Bondurant', 'Arizona'),
(100, '537 New Deepwood Court', 171, '8th Floor', 'Fairmont', 'West Pawlet', 'Delaware'),
(98, '151 Front Loop', 28, '89th Floor', 'Potomac', 'Convent', 'Georgia'),
(95, '162 Rock Hill Hwy', 112, '6th FL', 'Newman', 'Ft Deposit', 'North Carolina'),
(62, '3131 Social Ave', 78, '86th Floor', 'Potosi', 'Davenport', 'New Mexico'),
(79, '577 Red Riverview Blvd', 36, '6th FL', 'Newman Grove', 'North Attleboro', 'Illinois'),
(57, '1381 East Glenwood Blvd', 46, NULL, 'Ward', 'Ft Dodge', 'Vermont'),
(52, '1719 White Oak Ave', 82, '59th Floor', 'Kenilworth', 'Bonesteel', 'Mississippi'),
(74, '3706 South Riverside Ave', 63, NULL, 'Helen', 'David City', 'Montana'),
(80, '984 East Burwood Ct', 105, '8th Floor', 'Fairmount', 'Lincroft', 'North Carolina'),
(69, '601 S Chapel Hill Ct', 14, '66th Floor', 'Helena', 'Ft Drum', 'Texas'),
(75, '3644 Prospect Hill Pkwy', 61, '79th Floor', 'Bells', 'Pryor', 'Florida'),
(90, '1975 North Oak Hwy', 45, '72th FL', 'Potsdam', 'Stirling', 'Idaho'),
(58, '1015 Parkwood Court', 89, '72th FL', 'Fairplay', 'West Plains', 'Washington'),
(81, '2208 Old Prospect Hill Blvd', 125, '9th FL', 'Chrisman', 'Stockbridge', 'Ohio'),
(76, '584 East Rushwood Way', 139, '70th FL', 'Helendale', 'North Augusta', 'California'),
(64, '3066 SE Riddle Hill Way', 75, '76th Floor', 'Mc Afee', 'West Point', 'Georgia'),
(82, '2543 Red Cedar Tree Avenue', 109, 'Standard Bldg', 'South Walpole', 'Davidson', 'Tennessee'),
(70, '441 Red Fox Hill Way', 78, '6th FL', 'Fairport', 'Moxee', 'Wisconsin'),
(65, '610 NE Rockwood Ln', 15, '9th Floor', 'Wardell', 'Stockdale', 'Alaska'),
(85, '85 Riverview Ln', 185, '9th Floor', 'Bellville', 'Lind', 'New Jersey'),
(91, '3226 3rd Ct', 142, '9th Floor', 'Kenmare', 'Pueblo', 'Georgia'),
(53, '16 Rockwood Road', 133, '6th FL', 'South Wayne', 'Ft Duchesne', 'Arizona'),
(86, '91 N Lake Ct', 170, '59th Floor', 'Helenville', 'Davidsonville', 'Delaware'),
(71, '58 Sharp Hill Lane', 164, 'Kearns Building', 'Newman Lake', 'Converse', 'Mississippi'),
(92, '3510 Rose Hill Ln', 31, '9th FL', 'Warden', 'Bonham', 'Utah'),
(66, '652 New Mountain Way', 57, NULL, 'Mc Arthur', 'Moyock', 'Vermont'),
(87, '1873 Town Hwy', 52, '8th FL', 'Fairview', 'North Aurora', 'Oregon'),
(72, '28 North Quailwood Hwy', 182, '5th FL', 'Christiana', 'Lindale', 'Montana'),
(59, '1462 Edgewood Ln', 25, NULL, 'Helenwood', 'West Portsmouth', 'Florida'),
(93, '909 Beachwood Ct', 34, NULL, 'Fairview Heights', 'Conway', 'Delaware');

--
-- Inserting data into table professores
--
INSERT INTO professores(codPessoa, CPF, formacao, cursoFormacao) VALUES
(94, '653.516.412-65', 'Normal Superior', 'Information Technology'),
(2, '568.474.734-18', 'Bacharelado', 'Marketing'),
(52, '318.317.425-35', 'Bacharelado', 'Sales'),
(37, '653.516.412-65', 'Normal Superior', 'Information Technology'),
(81, '914.828.762-20', 'Bacharelado', 'Research and Development'),
(8, '071.000.448-85', 'Licenciatura', 'Finance'),
(58, '687.090.333-66', 'Licenciatura', 'Executive'),
(34, '542.982.023-74', 'Bacharelado', 'Research and Development'),
(84, '682.826.086-50', 'Licenciatura', 'Finance'),
(23, '022.043.228-96', 'Normal Superior', 'Operations');