
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
INSERT INTO curriculo(codCurriculo, Nome, Tipo) VALUES
('EFI', 'Ensino Fundamental Inicial', 'Bimestral'),
('EM', 'Ensino Médio', 'Bimestral');

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
('EFI', 'ART', 1, 2019, 192),
('EFI', 'ART', 2, 2020, 67),
('EFI', 'ART', 3, 2021, 125),
('EFI', 'ART', 4, 2022, 261),
('EFI', 'ART', 5, 2023, 130),
('EFI', 'CIE', 1, 2019, 124),
('EFI', 'CIE', 2, 2020, 45),
('EFI', 'CIE', 3, 2021, 211),
('EFI', 'CIE', 4, 2022, 64),
('EFI', 'CIE', 5, 2023, 100),
('EFI', 'EDF', 1, 2019, 96),
('EFI', 'EDF', 2, 2020, 127),
('EFI', 'EDF', 3, 2021, 259),
('EFI', 'EDF', 4, 2022, 211),
('EFI', 'EDF', 5, 2023, 194),
('EFI', 'EXC', 1, 2019, 54),
('EFI', 'EXC', 2, 2020, 166),
('EFI', 'EXC', 3, 2021, 119),
('EFI', 'EXC', 4, 2022, 139),
('EFI', 'EXC', 5, 2023, 121),
('EFI', 'GEO', 1, 2019, 166),
('EFI', 'GEO', 2, 2020, 138),
('EFI', 'GEO', 3, 2021, 289),
('EFI', 'GEO', 4, 2022, 49),
('EFI', 'GEO', 5, 2023, 186),
('EFI', 'HIS', 1, 2019, 161),
('EFI', 'HIS', 2, 2020, 44),
('EFI', 'HIS', 3, 2021, 237),
('EFI', 'HIS', 4, 2022, 109),
('EFI', 'HIS', 5, 2023, 40),
('EFI', 'ING', 1, 2019, 135),
('EFI', 'ING', 2, 2020, 251),
('EFI', 'ING', 3, 2021, 254),
('EFI', 'ING', 4, 2022, 283),
('EFI', 'ING', 5, 2023, 78),
('EFI', 'MAT', 1, 2019, 83),
('EFI', 'MAT', 2, 2020, 192),
('EFI', 'MAT', 3, 2021, 97),
('EFI', 'MAT', 4, 2022, 77),
('EFI', 'MAT', 5, 2023, 245),
('EFI', 'MUS', 1, 2019, 160),
('EFI', 'MUS', 2, 2020, 258),
('EFI', 'MUS', 3, 2021, 257),
('EFI', 'MUS', 4, 2022, 241),
('EFI', 'MUS', 5, 2023, 57),
('EFI', 'POR', 1, 2019, 186),
('EFI', 'POR', 2, 2020, 83),
('EFI', 'POR', 3, 2021, 197),
('EFI', 'POR', 4, 2022, 138),
('EFI', 'POR', 5, 2023, 112),

('EM', 'ART', 1, 2020, 192),
('EM', 'ART', 2, 2021, 67),
('EM', 'ART', 3, 2022, 125),
('EM', 'ART', 4, 2023, 261),
('EM', 'ART', 5, 2024, 130),
('EM', 'CIE', 1, 2020, 124),
('EM', 'CIE', 2, 2021, 45),
('EM', 'CIE', 3, 2022, 211),
('EM', 'CIE', 4, 2023, 64),
('EM', 'CIE', 5, 2024, 100),
('EM', 'EDF', 1, 2020, 96),
('EM', 'EDF', 2, 2021, 127),
('EM', 'EDF', 3, 2022, 259),
('EM', 'EDF', 4, 2023, 211),
('EM', 'EDF', 5, 2024, 194),
('EM', 'EXC', 1, 2020, 54),
('EM', 'EXC', 2, 2021, 166),
('EM', 'EXC', 3, 2022, 119),
('EM', 'EXC', 4, 2023, 139),
('EM', 'EXC', 5, 2024, 121),
('EM', 'GEO', 1, 2020, 166),
('EM', 'GEO', 2, 2021, 138),
('EM', 'GEO', 3, 2022, 289),
('EM', 'GEO', 4, 2023, 49),
('EM', 'GEO', 5, 2024, 186),
('EM', 'HIS', 1, 2020, 161),
('EM', 'HIS', 2, 2021, 44),
('EM', 'HIS', 3, 2022, 237),
('EM', 'HIS', 4, 2023, 109),
('EM', 'HIS', 5, 2024, 40),
('EM', 'ING', 1, 2020, 135),
('EM', 'ING', 2, 2021, 251),
('EM', 'ING', 3, 2022, 254),
('EM', 'ING', 4, 2023, 283),
('EM', 'ING', 5, 2024, 78),
('EM', 'MAT', 1, 2020, 83),
('EM', 'MAT', 2, 2021, 192),
('EM', 'MAT', 3, 2022, 97),
('EM', 'MAT', 4, 2023, 77),
('EM', 'MAT', 5, 2024, 245),
('EM', 'MUS', 1, 2020, 160),
('EM', 'MUS', 2, 2021, 258),
('EM', 'MUS', 3, 2022, 257),
('EM', 'MUS', 4, 2023, 241),
('EM', 'MUS', 5, 2024, 57),
('EM', 'POR', 1, 2020, 186),
('EM', 'POR', 2, 2021, 83),
('EM', 'POR', 3, 2022, 197),
('EM', 'POR', 4, 2023, 138),
('EM', 'POR', 5, 2024, 112);

--
-- Inserting data into table pessoas
--
INSERT INTO pessoas(codPessoa, Nome, Naturalidade, Dt_nascimento, CPF, Status) VALUES
(3, 'Michael Johnson', 'Zuni', '1970-03-30', '568.474.734-18', 'Ativo'),
(4, 'Kina Abraham', 'Pahrump', '2006-04-02', '024.391.304-34', 'Ativo'),
(5, 'Alexis Laflamme', 'Glen Haven', '2002-10-11', '085.643.486-21', 'Ativo'),
(6, 'Julienne Baxley', 'Rowley', '2015-09-13', NULL, 'Ativo'),
(7, 'Adolfo Bergeron', 'Houma', '1980-10-03', '653.359.505-61', 'Ativo'),
(8, 'Garry Metzger', 'Dresden', '2015-04-02', NULL, 'Ativo'),
(9, 'Cathrine Southerland', 'Paia', '1983-07-17', '071.000.448-85', 'Ativo'),
(10, 'Emely Shull', 'Glen Head', '2015-03-24', NULL, 'Ativo'),
(11, 'Charlsie Alston', 'Roxboro', '2015-09-27', NULL, 'Ativo'),
(12, 'Yevette Vanwinkle', 'Soquel', '1978-02-03', '743.385.760-54', 'Ativo'),
(13, 'Roxy Julian', 'Dresher', '1995-02-20', '394.744.976-96', 'Ativo'),
(14, 'Casey Pleasant', 'Lonsdale', '2015-03-23', NULL, 'Ativo'),
(15, 'Jefferey Abrams', 'Paicines', '1952-12-08', '339.878.364-77', 'Ativo'),
(16, 'Raymundo Bottoms', 'Glen Mills', '1949-04-10', '781.872.878-57', 'Ativo'),
(17, 'Sophia Driscoll', 'Roxbury', '2001-01-01', '210.966.183-06', 'Ativo'),
(18, 'Dave Browder', 'Housatonic', '2015-09-08', NULL, 'Ativo'),
(19, 'Randee Quinonez', 'Painesville', '2003-07-25', '756.530.267-07', 'Ativo'),
(20, 'Terrell Fryer', 'Roy', '2004-11-21', NULL, 'Ativo'),
(21, 'Nicola Neil', 'Loogootee', '2015-03-16', NULL, 'Ativo'),
(22, 'Earleen Sessions', 'Waialua', '2015-08-06', NULL, 'Ativo'),
(23, 'Daniele Hundley', 'Birchwood', '2001-01-04', '148.036.734-79', 'Ativo'),
(24, 'Lucrecia Cason', 'Dresser', '1986-02-20', '022.043.228-96', 'Ativo'),
(25, 'Adeline Abraham', 'Cobb', '1949-01-05', '464.230.396-53', 'Ativo'),
(26, 'Tresa Mallory', 'Sorrento', '2015-06-14', NULL, 'Ativo'),
(27, 'Timika Leger', 'Waianae', '2002-07-31', '443.687.271-93', 'Ativo'),
(28, 'Curt Munoz', 'Bird City', '2001-01-05', '581.791.771-60', 'Ativo'),
(29, 'Angelika Hinkle', 'Cobden', '2002-03-30', '886.136.549-08', 'Ativo'),
(30, 'Bradford Meza', 'Glen Oaks', '1986-11-04', '916.413.798-53', 'Ativo'),
(31, 'Cordie Acker', 'Bird Island', '2002-06-15', '143.080.561-04', 'Ativo'),
(32, 'Mickey Brubaker', 'Drexel', '1979-10-21', '689.326.279-36', 'Ativo'),
(33, 'Neville Triplett', 'Glen Riddle Lima', '1949-04-25', '509.692.909-29', 'Ativo'),
(34, 'Agripina Mcclendon', 'Drexel Hill', '1949-03-20', '174.392.340-84', 'Ativo'),
(35, 'Maxie Parnell', 'Soso', '1986-01-02', '542.982.023-74', 'Ativo'),
(36, 'Hue Reece', 'Glen Ridge', '2015-12-02', NULL, 'Ativo'),
(37, 'Fay Matson', 'House Springs', '1950-10-19', '545.947.609-11', 'Ativo'),
(38, 'Emiko Colbert', 'Paint Rock', '1974-10-28', '639.181.206-57', 'Ativo'),
(39, 'Alphonso Artis', 'Driftwood', '2002-04-20', '316.138.357-58', 'Ativo'),
(40, 'Vernon Tibbs', 'Royal Center', '2003-01-25', '720.362.941-10', 'Ativo'),
(41, 'Abby Webster', 'Glen Rock', '2002-02-20', '575.308.048-59', 'Ativo'),
(42, 'Tosha Fischer', 'Waikoloa', '2015-11-01', NULL, 'Ativo'),
(43, 'Versie Andrade', 'Cobleskill', '2001-01-08', '001.881.785-61', 'Ativo'),
(44, 'Alisa Almeida', 'Driggs', '1949-01-04', '834.419.442-87', 'Ativo'),
(45, 'Terrence Hazel', 'Birdsboro', '1967-09-29', '927.916.952-51', 'Ativo'),
(46, 'Jenelle Woodard', 'Souderton', '2014-04-09', '889.459.073-36', 'Ativo'),
(47, 'Alva Westfall', 'Painted Post', '1980-01-09', '882.217.502-31', 'Ativo'),
(48, 'Adah Caballero', 'Royal City', '1953-10-30', '203.913.421-14', 'Ativo'),
(49, 'Ramona Correia', 'Lookeba', '1970-11-12', '369.565.380-87', 'Ativo'),
(50, 'Paige Welsh', 'Painter', '1980-10-13', '719.597.736-05', 'Ativo'),
(51, 'Kevin Stephen', 'Glen Rose', '1949-01-05', '785.086.799-41', 'Ativo'),
(52, 'Camie Cosgrove', 'Houston', '1955-09-29', '286.499.719-19', 'Ativo'),
(53, 'Gale Elliott', 'Eleva', '1970-03-30', '318.317.425-35', 'Ativo'),
(54, 'Damien Gibbs', 'Lonoke', '1970-04-02', '508.244.707-97', 'Ativo'),
(55, 'Kareem Culver', 'Zuni', '2002-10-11', '557.654.053-40', 'Ativo'),
(56, 'Houston Contreras', 'Porterville', '2006-09-13', '399.049.427-93', 'Ativo'),
(57, 'Alonzo Calvin', 'Houma', '2001-10-03', '304.892.871-27', 'Ativo'),
(58, 'Trudie Abney', 'Block Island', '2003-04-02', '079.920.591-94', 'Ativo'),
(59, 'Alane Patrick', 'Lonsdale', '1983-07-17', '687.090.333-66', 'Ativo'),
(60, 'Berry Pedersen', 'Hackettstown', '2006-03-24', '312.297.967-54', 'Ativo'),
(61, 'Maria Abney', 'Coloma', '2006-09-27', '641.656.173-92', 'Ativo'),
(62, 'Joette Valdez', 'Elfers', '1978-02-03', '634.155.570-67', 'Ativo'),
(63, 'Adah Ambrose', 'Haddam', '1995-02-20', '570.285.022-43', 'Ativo'),
(64, 'Thresa Park', 'Blomkest', '2014-03-23', '005.018.687-36', 'Ativo'),
(65, 'Bryant Blanchard', 'Elgin', '1952-12-08', '763.479.395-36', 'Ativo'),
(66, 'Alexis Mallory', 'Colome', '1949-04-10', '967.321.760-94', 'Ativo'),
(67, 'Alida Dover', 'Haddon Heights', '2001-01-01', '554.393.961-66', 'Ativo'),
(68, 'Alane Alves', 'Newburg', '2006-09-08', '048.075.712-28', 'Ativo'),
(69, 'Steven Lombard', 'Porthill', '2003-07-25', '755.629.736-58', 'Ativo'),
(70, 'Amina Hickman', 'Elida', '2004-11-21', '828.560.417-42', 'Ativo'),
(71, 'Moises Kellogg', 'Williams', '2014-03-16', '112.632.066-50', 'Ativo'),
(72, 'Orlando Rich', 'Housatonic', '2002-08-06', '822.899.574-95', 'Ativo'),
(73, 'Lakenya Godfrey', 'Loogootee', '2001-01-04', '720.567.839-02', 'Ativo'),
(74, 'Norma Forrester', 'Bloomdale', '1986-02-20', '000.176.220-18', 'Ativo'),
(75, 'Edmond Pollock', 'Suttons Bay', '1949-01-05', '412.900.638-31', 'Ativo'),
(76, 'Roderick Mims', 'Haddonfield', '1980-06-14', '973.663.468-10', 'Ativo'),
(77, 'Foster Cantwell', 'House Springs', '2002-07-31', '587.011.378-61', 'Ativo'),
(78, 'Cletus Rosado', 'Williams Bay', '2001-01-05', '383.492.194-34', 'Ativo'),
(79, 'Alina Buckner', 'Colon', '1960-03-30', '200.249.417-01', 'Ativo'),
(80, 'Eusebio Truong', 'Newburgh', '1986-11-04', '850.106.401-74', 'Ativo'),
(81, 'Gay Maples', 'Lookeba', '1985-06-15', '534.440.603-52', 'Ativo'),
(82, 'Verena Allred', 'Bloomer', '1979-10-21', '914.828.762-20', 'Ativo'),
(83, 'Shaina Crouse', 'Houston', '1949-04-25', '611.256.119-59', 'Ativo'),
(84, 'Mirtha Mcginnis', 'Eliot', '1949-03-20', '609.953.209-07', 'Ativo'),
(85, 'Fermin Amaya', 'Portland', '1986-01-02', '682.826.086-50', 'Ativo'),
(86, 'Adaline Alston', 'Colonia', '2014-12-02', '462.419.901-65', 'Ativo'),
(87, 'Andy Cowart', 'Bloomfield', '1950-10-19', '226.570.464-82', 'Ativo'),
(88, 'Jarrod Abraham', 'Colonial Beach', '1974-10-28', '858.176.670-85', 'Ativo'),
(89, 'Benita Morin', 'Bloomfield Hills', '2002-04-20', '343.494.898-48', 'Ativo'),
(90, 'Gerald Kinder', 'Newbury', '2003-01-25', '904.619.869-34', 'Ativo'),
(91, 'Cynthia Butterfield', 'Portola', '1980-02-20', '750.274.633-30', 'Ativo'),
(92, 'Dexter Burt', 'Colonial Heights', '2005-11-01', '731.999.341-30', 'Ativo'),
(93, 'Gregory Dodge', 'Suwanee', '2015-01-08', NULL, 'Ativo'),
(94, 'Tessie Alba', 'Newbury Park', '1949-01-04', '484.100.515-39', 'Ativo'),
(95, 'Pandora Lindgren', 'Portola Valley', '1967-09-29', '653.516.412-65', 'Ativo'),
(96, 'Alva Batten', 'Newburyport', '2001-04-09', '779.031.017-15', 'Ativo'),
(97, 'Antonia Langford', 'Lookout', '2001-01-09', '535.540.136-31', 'Ativo'),
(98, 'Darleen Bratcher', 'Houtzdale', '1953-10-30', '097.963.451-24', 'Ativo'),
(99, 'Stanley Anderson', 'Hadley', '2003-11-12', '612.620.363-33', 'Ativo'),
(100, 'Clarence Abbott', 'Elizabeth', '2004-10-13', '906.058.179-07', 'Ativo'),
(101, 'Clint Merriman', 'Lookout Mountain', '1949-01-05', '856.487.469-50', 'Ativo'),
(102, 'Johnson Carl', 'Hagerman', '2015-09-29', NULL, 'Ativo');
--
-- Inserting data into table contatos
--
INSERT INTO contatos(codPessoa, Telefone, Celular, Email, whatsapp) VALUES
(16, '353-5572', '07624803317', NULL, 0),
(38, '616-9947', '07624169351', 'Whitman9@example.com', 1),
(5, '522-4615', '07624874175', 'Lutz438@nowhere.com', 1),
(44, '755-7107', '07624899137', 'RegaladoO@example.com', 0),
(39, '819-2339', '07624322612', 'Hyman@example.com', 1),
(52, '329-7457', '07489326554', 'KareemBinkley@example.com', 0),
(47, '199-0109', '07743451746', 'Eda_Mallory577@example.com', 1),
(45, '210-9996', '07624556610', 'RicardaNAndre@example.com', 1),
(17, '252-2063', '07624681138', 'BannisterO485@example.com', 0),
(48, NULL, '07624205787', 'MauricePepper949@example.com', 1),
(40, '820-8663', '07624555456', 'Fay.Andres@example.com', 0),
(23, '130-5414', '07946966534', NULL, 1),
(51, '446-3801', '07414807942', 'jmcqy5@example.com', 0),
(29, NULL, '07624509212', NULL, 1),
(12, '459-9752', '07892768299', 'Acevedo733@example.com', 1),
(35, '994-4885', '07955118704', 'Abreu@example.com', 0),
(49, '929-2660', '07624477691', 'Moeller@example.com', 0),
(30, '260-1808', '07750664570', 'Acker@example.com', 0),
(7, '776-1259', '07624368702', 'ElissaJacobs@example.com', 1),
(25, '917-9051', '07979281006', 'rxrisnix_pmwl@nowhere.com', 1),
(31, '676-0646', '07624505020', 'gmfyejp7@example.com', 0),
(24, '255-7135', '07910493786', 'FallonLane@example.com', 0),
(19, '817-6388', '07548756031', 'Alvin.Hahn@example.com', 1),
(41, '789-7791', '07737527359', 'bfpu4@example.com', 1),
(13, '942-6880', '07826765929', 'ElijahAbney@example.com', 0),
(3, '164-5886', '07586965071', NULL, 1),
(20, '897-2397', '07624693736', 'IlonaAshmore@example.com', 0),
(15, '227-5278', '07624238019', 'Valentin@nowhere.com', 0),
(32, '832-2704', '07624361530', 'ylffg9891@example.com', 1),
(9, '708-4044', '07490566384', 'Keith29@nowhere.com', 1),
(4, '881-6586', '07624194349', 'Acker@example.com', 1),
(27, '975-1279', '07624957791', 'xrysmi3@example.com', 1),
(37, '092-6323', '07624038553', 'LaddT@nowhere.com', 0),
(43, '809-2267', '07890907502', NULL, 1),
(33, '043-5913', '07624932601', 'CurtisBTrimble2@example.com', 0),
(28, '235-9468', '07785299994', NULL, 1),
(34, '347-3774', '07741851475', 'IgnacioEllington43@example.com', 1),
(66, '(69)9496-8271', '(49)97687-8343', NULL, 0),
(88, '(12)3571-3357', '(79)97551-8616', 'Whitman9@example.com', 1),
(72, NULL, '(17)93157-8164', 'Stacey85@nowhere.com', 0),
(55, '(87)7999-2796', '(13)95516-7684', 'Lutz438@nowhere.com', 1),
(94, '(95)7457-7392', '(12)93371-9475', 'RegaladoO@example.com', 0),
(89, '(41)3108-0542', '(61)92661-1042', 'Hyman@example.com', 1),
(102, '(19)1869-2249', '(63)95025-5660', 'KareemBinkley@example.com', 0),
(97, '(13)7505-4599', '(46)95521-0234', 'Eda_Mallory577@example.com', 1),
(100, '(64)0428-2236', '(53)97620-1026', 'AguiarP@nowhere.com', 0),
(95, '(23)1963-2114', '(12)94175-9049', 'RicardaNAndre@example.com', 1),
(67, '(44)2053-1405', '(18)96396-7062', 'BannisterO485@example.com', 0),
(98, NULL, '(56)92885-5570', 'MauricePepper949@example.com', 1),
(90, '(32)0815-6379', '(53)92343-7061', 'Fay.Andres@example.com', 0),
(73, '(39)9174-2527', '(61)91517-7417', NULL, 1),
(61, '(21)7307-5158', '(66)92619-8387', 'Wade.H.Marx722@example.com', 1),
(56, '(42)8147-0750', '(81)92042-8927', 'zajvyfes_gigpanbvkz@example.com', 0),
(101, '(42)6044-0106', '(18)96582-9050', 'jmcqy5@example.com', 0),
(79, NULL, '(74)98901-6863', NULL, 1),
(62, '(84)6553-1358', '(78)91193-4711', 'Acevedo733@example.com', 1),
(85, '(13)2602-6230', '(33)96366-2618', 'Abreu@example.com', 0),
(99, '(29)8375-1871', '(18)91734-2994', 'Moeller@example.com', 0),
(80, '(32)5632-0796', '(12)99462-4632', 'Acker@example.com', 0),
(57, '(56)6393-2823', '(46)99649-5346', 'ElissaJacobs@example.com', 1),
(96, '(93)4809-6135', '(78)98090-9050', NULL, 1),
(68, '(63)5751-0109', '(18)90649-2240', NULL, 0),
(75, '(94)1273-3792', '(55)90321-7365', 'rxrisnix_pmwl@nowhere.com', 1),
(81, '(78)4490-0021', '(55)97655-7877', 'gmfyejp7@example.com', 0),
(74, '(86)4091-2255', '(59)93129-9947', 'FallonLane@example.com', 0),
(69, '(95)3941-6026', '(35)93639-5425', 'Alvin.Hahn@example.com', 1),
(91, '(57)2632-1722', '(78)92841-7297', 'bfpu4@example.com', 1),
(63, '(39)3936-1921', '(13)95574-4612', 'ElijahAbney@example.com', 0),
(58, '(87)7279-5889', '(64)99210-6035', 'Marchand@example.com', 0),
(53, '(91)4896-4737', '(73)91816-4646', 'MasonM_Cortes145@nowhere.com', 1),
(92, NULL, '(46)90155-3882', 'IlonaAshmore@example.com', 0),
(70, '(25)1605-8305', '(29)91672-3378', 'Valentin@nowhere.com', 0),
(65, '(48)3022-4611', '(64)98570-0380', 'ylffg9891@example.com', 0),
(82, '(93)8034-7465', '(68)91728-9777', 'Keith29@nowhere.com', 1),
(59, '(28)8996-2986', '(61)91659-9624', 'Acker@example.com', 1),
(54, '(29)6793-9890', '(52)95435-8269', 'Abrams29@example.com', 1),
(60, '(92)5116-2694', '(47)93495-3079', 'xrysmi3@example.com', 1),
(77, '(84)6410-9678', '(66)91734-1892', 'LaddT@nowhere.com', 1),
(87, '(94)0489-7713', '(38)98938-5446', 'CurtisBTrimble2@example.com', 0),
(83, '(14)8302-4615', '(98)96628-3899', 'Forsythe@nowhere.com', 0),
(78, '(61)6668-0857', '(67)91722-7826', 'Toby.Dellinger@example.com', 1),
(84, NULL, '(83)96723-4305', 'ScottyNavarro6@example.com', 1);

--
-- Inserting data into table enderecos
--
INSERT INTO enderecos(codPessoa, Rua, Numero, Complemento, Bairro, Cidade, Estado) VALUES
(18, '99 NE Sharp Hill Parkway', 65, '4th FL', 'Newkirk', 'Stinson Beach', 'Wisconsin'),
(24, '2470 N Lake Dr', 22, '63th FL', 'Zuni', 'Datil', 'Kentucky'),
(52, '85 NW Buttonwood Street', '19', '43th Floor', 'Kenduskeag', 'Mousie', 'Colorado'),
(47, '59 W Stonewood Ln', 07, '61th FL', 'Mazeppa', 'North Arlington', 'Maryland'),
(19, '82 Ironwood Street', 23, '9th Floor', 'Bellmore', 'Lincolnton', 'Wyoming'),
(5, '473 Parkwood Lane', 42, '7th FL', 'Choteau', 'Continental', 'Mississippi'),
(50, '384 Glenwood Hwy', 97, '87th Floor', 'Bellows Falls', 'Bonduel', 'Hawaii'),
(11, '668 2nd Lane', 27, '6th FL', 'Kenedy', 'Ft Davis', 'Missouri'),
(14, '2165 White Stonewood Loop', '72', '58th FL', 'Mazomanie', 'Moville', 'Tennessee'),
(6, '856 Market Blvd', 30, '61th FL', 'Potlatch', 'Lincolnville', 'Arizona'),
(39, '2691 Oak Ct', 84, '8th FL', 'Fairless Hills', 'Dauphin', 'Nebraska'),
(12, '505 Chapel Hill Ave', 03, '4th FL', 'Newland', 'Ft Defiance', 'Texas'),
(48, '92 Old Brentwood Ct', 12, '5th FL', 'Wappingers Falls', 'Contoocook', 'Ohio'),
(28, '3246 N Rockwood Blvd', 08, '89th Floor', 'South Thomaston', 'Prue', 'Nevada'),
(34, '725 Waterview Highway', 70, 'Enquirer Bldg', 'Chouteau', 'Moweaqua', 'Texas'),
(45, '3886 NW Oak Ln', 55, '69th Floor', 'Bellport', 'Zuni', 'North Carolina'),
(29, '497 Lake Way', 22, '78th FL', 'Wapwallopen', 'Dauphin Island', 'Ohio'),
(35, '2363 Buttonwood Court', 57, '8th Floor', 'South Wales', 'Lincolnwood', 'Colorado'),
(40, '830 S Prospect Hill Parkway', 13, '58th FL', 'Heislerville', 'Mower County', 'Alaska'),
(7, '1562 2nd Lane', 98, '85th FL', 'Chowchilla', 'Bondurant', 'Arizona'),
(51, '2485 West Mount Circle', 58, '8th Floor', 'Fairmont', 'West Pawlet', 'Delaware'),
(49, '3670 Oak Rd', 32, '89th Floor', 'Potomac', 'Convent', 'Georgia'),
(46, '1318 SE Buttonwood Street', 88, '6th FL', 'Newman', 'Ft Deposit', 'North Carolina'),
(13, '642 E Town Ct', 99, '86th Floor', 'Potosi', 'Davenport', 'New Mexico'),
(30, '197 SE Rose Hill Ln', 87, '6th FL', 'Newman Grove', 'North Attleboro', 'Illinois'),
(8, '2154 Rock Hill Circle', 51, NULL, 'Ward', 'Ft Dodge', 'Vermont'),
(3, '286 Sharp Hill Loop', 68, '59th Floor', 'Kenilworth', 'Bonesteel', 'Mississippi'),
(25, '569 Pine Tree Street', 73, NULL, 'Helen', 'David City', 'Montana'),
(31, '253 Ski Hill Ave', 20, '8th Floor', 'Fairmount', 'Lincroft', 'North Carolina'),
(20, '2344 Beachwood Pkwy', 62, '66th Floor', 'Helena', 'Ft Drum', 'Texas'),
(26, '213 Burwood Ct', 70, '79th Floor', 'Bells', 'Pryor', 'Florida'),
(41, '1486 W Prospect Hill Ct', 29, '72th FL', 'Potsdam', 'Stirling', 'Idaho'),
(9, '3302 Mountain Way', 37, '72th FL', 'Fairplay', 'West Plains', 'Washington'),
(32, '2802 New Ski Hill Hwy', 92, '9th FL', 'Chrisman', 'Stockbridge', 'Ohio'),
(27, '2605 Prospect Hill Dr', 75, '70th FL', 'Helendale', 'North Augusta', 'California'),
(15, '942 SW Glenwood Circle', 84, '76th Floor', 'Mc Afee', 'West Point', 'Georgia'),
(33, '649 Old Social Lane', 40, 'Standard Bldg', 'South Walpole', 'Davidson', 'Tennessee'),
(21, '910 Front Drive', 72, '6th FL', 'Fairport', 'Moxee', 'Wisconsin'),
(16, '2982 SW Riddle Hill Lane', 91, '9th Floor', 'Wardell', 'Stockdale', 'Alaska'),
(36, '13 E Town Street', 67, '9th Floor', 'Bellville', 'Lind', 'New Jersey'),
(42, '3713 Bayview Ct', 33, '9th Floor', 'Kenmare', 'Pueblo', 'Georgia'),
(4, '123 E Chapel Hill Ct', 28, '6th FL', 'South Wayne', 'Ft Duchesne', 'Arizona'),
(37, '2083 Ironwood Ct', 59, '59th Floor', 'Helenville', 'Davidsonville', 'Delaware'),
(22, '2714 Beachwood Way', 46, 'Kearns Building', 'Newman Lake', 'Converse', 'Mississippi'),
(43, '60 East Hazelwood Dr', 20, '9th FL', 'Warden', 'Bonham', 'Utah'),
(17, '241 Old Beachwood Parkway', 93, NULL, 'Mc Arthur', 'Moyock', 'Vermont'),
(38, '2710 Stonewood Road', 89, '8th FL', 'Fairview', 'North Aurora', 'Oregon'),
(23, '1512 White Oak Blvd', 58, '5th FL', 'Christiana', 'Lindale', 'Montana'),
(10, '554 Sharp Hill Parkway', 41, NULL, 'Helenwood', 'West Portsmouth', 'Florida'),
(44, '38 S Ashwood Ct', 48, NULL, 'Fairview Heights', 'Conway', 'Delaware'),
(68, '71 Hunting Hill Ln', 54, '4th FL', 'Newkirk', 'Stinson Beach', 'Wisconsin'),
(74, '729 Bayview Pkwy', 85, '63th FL', 'Zuni', 'Datil', 'Kentucky'),
(102, '48 Monument Ave', 121, '43th Floor', 'Kenduskeag', 'Mousie', 'Colorado'),
(97, '1331 Red Rock Hill Loop', 26, '61th FL', 'Mazeppa', 'North Arlington', 'Maryland'),
(69, '75 East Front Ln', 192, '9th Floor', 'Bellmore', 'Lincolnton', 'Wyoming'),
(55, '71 W Deepwood Lane', 63, '7th FL', 'Choteau', 'Continental', 'Mississippi'),
(100, '114 Market Ln', 88, '87th Floor', 'Bellows Falls', 'Bonduel', 'Hawaii'),
(61, '2538 1st Parkway', 189, '6th FL', 'Kenedy', 'Ft Davis', 'Missouri'),
(64, '1166 Old Fox Hill Rd', 50, '58th FL', 'Mazomanie', 'Moville', 'Tennessee'),
(56, '17 East Buttonwood Pkwy', 42, '61th FL', 'Potlatch', 'Lincolnville', 'Arizona'),
(89, '133 Church Loop', 179, '8th FL', 'Fairless Hills', 'Dauphin', 'Nebraska'),
(62, '446 Red Beachwood Way', 108, '4th FL', 'Newland', 'Ft Defiance', 'Texas'),
(98, '3588 Rose Hill Parkway', 97, '5th FL', 'Wappingers Falls', 'Contoocook', 'Ohio'),
(78, '1151 Cedar Tree Ct', 22, '89th Floor', 'South Thomaston', 'Prue', 'Nevada'),
(84, '510 Meadowview St', 135, 'Enquirer Bldg', 'Chouteau', 'Moweaqua', 'Texas'),
(95, '898 South Beachwood Circle', 177, '69th Floor', 'Bellport', 'Zuni', 'North Carolina'),
(79, '24 Riverside Pkwy', 36, '78th FL', 'Wapwallopen', 'Dauphin Island', 'Ohio'),
(85, '222 Waterview Ct', 12, '8th Floor', 'South Wales', 'Lincolnwood', 'Colorado'),
(90, '1807 NE Pine Tree Ct', 83, '58th FL', 'Heislerville', 'Mower County', 'Alaska'),
(57, '244 White Social Parkway', 24, '85th FL', 'Chowchilla', 'Bondurant', 'Arizona'),
(101, '537 New Deepwood Court', 171, '8th Floor', 'Fairmont', 'West Pawlet', 'Delaware'),
(99, '151 Front Loop', 28, '89th Floor', 'Potomac', 'Convent', 'Georgia'),
(96, '162 Rock Hill Hwy', 112, '6th FL', 'Newman', 'Ft Deposit', 'North Carolina'),
(63, '3131 Social Ave', 78, '86th Floor', 'Potosi', 'Davenport', 'New Mexico'),
(80, '577 Red Riverview Blvd', 36, '6th FL', 'Newman Grove', 'North Attleboro', 'Illinois'),
(58, '1381 East Glenwood Blvd', 46, NULL, 'Ward', 'Ft Dodge', 'Vermont'),
(53, '1719 White Oak Ave', 82, '59th Floor', 'Kenilworth', 'Bonesteel', 'Mississippi'),
(75, '3706 South Riverside Ave', 63, NULL, 'Helen', 'David City', 'Montana'),
(81, '984 East Burwood Ct', 105, '8th Floor', 'Fairmount', 'Lincroft', 'North Carolina'),
(70, '601 S Chapel Hill Ct', 14, '66th Floor', 'Helena', 'Ft Drum', 'Texas'),
(76, '3644 Prospect Hill Pkwy', 61, '79th Floor', 'Bells', 'Pryor', 'Florida'),
(91, '1975 North Oak Hwy', 45, '72th FL', 'Potsdam', 'Stirling', 'Idaho'),
(59, '1015 Parkwood Court', 89, '72th FL', 'Fairplay', 'West Plains', 'Washington'),
(82, '2208 Old Prospect Hill Blvd', 125, '9th FL', 'Chrisman', 'Stockbridge', 'Ohio'),
(77, '584 East Rushwood Way', 139, '70th FL', 'Helendale', 'North Augusta', 'California'),
(65, '3066 SE Riddle Hill Way', 75, '76th Floor', 'Mc Afee', 'West Point', 'Georgia'),
(83, '2543 Red Cedar Tree Avenue', 109, 'Standard Bldg', 'South Walpole', 'Davidson', 'Tennessee'),
(71, '441 Red Fox Hill Way', 78, '6th FL', 'Fairport', 'Moxee', 'Wisconsin'),
(66, '610 NE Rockwood Ln', 15, '9th Floor', 'Wardell', 'Stockdale', 'Alaska'),
(86, '85 Riverview Ln', 185, '9th Floor', 'Bellville', 'Lind', 'New Jersey'),
(92, '3226 3rd Ct', 142, '9th Floor', 'Kenmare', 'Pueblo', 'Georgia'),
(54, '16 Rockwood Road', 133, '6th FL', 'South Wayne', 'Ft Duchesne', 'Arizona'),
(87, '91 N Lake Ct', 170, '59th Floor', 'Helenville', 'Davidsonville', 'Delaware'),
(72, '58 Sharp Hill Lane', 164, 'Kearns Building', 'Newman Lake', 'Converse', 'Mississippi'),
(93, '3510 Rose Hill Ln', 31, '9th FL', 'Warden', 'Bonham', 'Utah'),
(67, '652 New Mountain Way', 57, NULL, 'Mc Arthur', 'Moyock', 'Vermont'),
(88, '1873 Town Hwy', 52, '8th FL', 'Fairview', 'North Aurora', 'Oregon'),
(73, '28 North Quailwood Hwy', 182, '5th FL', 'Christiana', 'Lindale', 'Montana'),
(60, '1462 Edgewood Ln', 25, NULL, 'Helenwood', 'West Portsmouth', 'Florida'),
(94, '909 Beachwood Ct', 34, NULL, 'Fairview Heights', 'Conway', 'Delaware');

--
-- Inserting data into table professores
--
INSERT INTO professores(codPessoa, CPF, formacao, cursoFormacao, Status) VALUES
(95, '653.516.412-65', 'Normal Superior', 'Information Technology', 'Ativo'),
(3, '568.474.734-18', 'Bacharelado', 'Marketing', 'Ativo'),
(53, '318.317.425-35', 'Bacharelado', 'Sales', 'Ativo'),
(38, '653.516.412-65', 'Normal Superior', 'Information Technology', 'Ativo'),
(82, '914.828.762-20', 'Bacharelado', 'Research and Development', 'Ativo'),
(9, '071.000.448-85', 'Licenciatura', 'Finance', 'Ativo'),
(59, '687.090.333-66', 'Licenciatura', 'Executive', 'Ativo'),
(35, '542.982.023-74', 'Bacharelado', 'Research and Development', 'Ativo'),
(85, '682.826.086-50', 'Licenciatura', 'Finance', 'Ativo'),
(24, '022.043.228-96', 'Normal Superior', 'Operations', 'Ativo');

--
-- Inserting data into table professores-disciplinas
--
INSERT INTO `professores-disciplinas`(codProfessor, codDisciplina, codCurriculo, ano) VALUES
(95, 'POR', 'EFI', 1),
(95, 'POR', 'EFI', 2),
(95, 'POR', 'EFI', 3),
(95, 'POR', 'EFI', 4),
(95, 'POR', 'EFI', 5),
(3, 'MAT', 'EFI', 1),
(3, 'MAT', 'EFI', 2),
(3, 'MAT', 'EFI', 3),
(3, 'MAT', 'EFI', 4),
(3, 'MAT', 'EFI', 5),
(38, 'GEO', 'EFI', 1),
(38, 'GEO', 'EFI', 2),
(38, 'GEO', 'EFI', 3),
(38, 'GEO', 'EFI', 4),
(38, 'GEO', 'EFI', 5),
(82, 'HIS', 'EFI', 1),
(82, 'HIS', 'EFI', 2),
(82, 'HIS', 'EFI', 3),
(82, 'HIS', 'EFI', 4),
(82, 'HIS', 'EFI', 5),
(9, 'CIE', 'EFI', 1),
(9, 'CIE', 'EFI', 2),
(9, 'CIE', 'EFI', 3),
(9, 'CIE', 'EFI', 4),
(9, 'CIE', 'EFI', 5),
(59, 'MUS', 'EFI', 1),
(59, 'MUS', 'EFI', 2),
(59, 'MUS', 'EFI', 3),
(59, 'MUS', 'EFI', 4),
(59, 'MUS', 'EFI', 5),
(35, 'ART', 'EFI', 1),
(35, 'ART', 'EFI', 2),
(35, 'ART', 'EFI', 3),
(35, 'ART', 'EFI', 4),
(35, 'ART', 'EFI', 5),
(85, 'ING', 'EFI', 1),
(85, 'ING', 'EFI', 2),
(85, 'ING', 'EFI', 3),
(85, 'ING', 'EFI', 4),
(85, 'ING', 'EFI', 5),
(24, 'EXC', 'EFI', 1),
(24, 'EXC', 'EFI', 2),
(24, 'EXC', 'EFI', 3),
(24, 'EXC', 'EFI', 4),
(24, 'EXC', 'EFI', 5),
(53, 'EDF', 'EFI', 1),
(53, 'EDF', 'EFI', 2),
(53, 'EDF', 'EFI', 3),
(53, 'EDF', 'EFI', 4),
(53, 'EDF', 'EFI', 5);

--
-- Inserting data into table ResponsaveisFinanceiros
--
INSERT INTO ResponsaveisFinanceiros(codPessoa, codAluno, CPF, Status) VALUES
(51, 102, '785.086.799-41', 'Ativo'),
(50, 93, '719.597.736-05', 'Ativo'),
(49, 42, '369.565.380-87', 'Ativo'),
(48, 36, '203.913.421-14', 'Ativo'),
(47, 26, '882.217.502-31', 'Ativo'),
(81, 22, '534.440.603-52', 'Ativo'),
(54, 21, '508.244.707-97', 'Ativo'),
(76, 20, '973.663.468-10', 'Ativo'),
(83, 18, '611.256.119-59', 'Ativo'),
(79, 14, '200.249.417-01', 'Ativo'),
(7, 11, '653.359.505-61', 'Ativo'),
(91, 10, '750.274.633-30', 'Ativo'),
(37, 8, '545.947.609-11', 'Ativo'),
(101, 6, '856.487.469-50', 'Ativo');

--
-- Inserting data into table alunos
--
INSERT INTO alunos(codPessoa, nomeMae, nomePai, codResponsavelFin, Status) VALUES
(102, 'maria', 'jose', 51, "Ativo"),
(93, 'maria', 'jose', 50, "Ativo"),
(42, 'maria', 'jose', 49, "Ativo"),
(36, 'maria', 'jose', 48, "Ativo"),
(26, 'maria', 'jose', 47, "Ativo"),
(22, 'maria', 'jose', 81, "Ativo"),
(21, 'maria', 'jose', 54, "Ativo"),
(20, 'maria', 'jose', 76, "Ativo"),
(18, 'maria', 'jose', 83, "Ativo"),
(14, 'maria', 'jose', 79, "Ativo"),
(11, 'maria', 'jose', 7, "Ativo"),
(10, 'maria', 'jose', 91, "Ativo"),
(8, 'maria', 'jose', 37, "Ativo"),
(6, 'maria', 'jose', 101, "Ativo");

--
-- Inserting data into table Turmas
--
INSERT INTO Turmas(codTurma, codCurriculo, anoLetivo, ano) VALUES
(codTurma, 'EFI', 2019, 1);

--
-- Inserting data into table Aluno-Turma
--
INSERT INTO `Aluno-Turma`(codAluno, codTurma, situacao) VALUES
(102, 1, 'Pendente'),
(93, 1, 'Pendente'),
(42, 1, 'Pendente'),
(36, 1, 'Pendente'),
(26, 1, 'Pendente'),
(22, 1, 'Pendente'),
(21, 1, 'Pendente'),
(20, 1, 'Pendente'),
(18, 1, 'Pendente'),
(14, 1, 'Pendente'),
(11, 1, 'Pendente'),
(10, 1, 'Pendente'),
(8, 1, 'Pendente'),
(6, 1, 'Pendente');