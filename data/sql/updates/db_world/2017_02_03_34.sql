-- DB update 2017_02_03_33 -> 2017_02_03_34
DROP PROCEDURE IF EXISTS `updateDb`;
DELIMITER //
CREATE PROCEDURE updateDb ()
proc:BEGIN DECLARE OK VARCHAR(100) DEFAULT 'FALSE';
SELECT COUNT(*) INTO @COLEXISTS 
FROM information_schema.COLUMNS 
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'version_db_world' AND COLUMN_NAME = '2017_02_03_33';
IF @COLEXISTS = 0 THEN LEAVE proc; END IF;
START TRANSACTION;
ALTER TABLE version_db_world CHANGE COLUMN 2017_02_03_33 2017_02_03_34 bit;
SELECT sql_rev INTO OK FROM version_db_world WHERE sql_rev = '1485433257771075000'; IF OK <> 'FALSE' THEN LEAVE proc; END IF;
--
-- START UPDATING QUERIES
--
INSERT INTO version_db_world (`sql_rev`) VALUES ('1485433257771075000');
-- Eye of Naxxramas -- http://www.wowhead.com/npc=10411
SET @GUID := 73922; -- 3 creatures needed CONSECUTIVE
DELETE FROM `creature` WHERE `guid` BETWEEN (@GUID + 0) AND (@GUID + 2);
DELETE FROM `creature` WHERE `id`=10411;
INSERT INTO `creature` (`guid`, `id`, `map`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`) VALUES
((@GUID + 0), 10411, 329, 4629, 0, 3479.085, -3306.330, 130.6843, 0.104871, 900, 0, 0, 0, 0, 2),
((@GUID + 1), 10411, 329, 4629, 0, 3582.750, -3465.926, 135.4136, 5.451532, 900, 0, 0, 0, 0, 2),
((@GUID + 2), 10411, 329, 4629, 0, 4068.063, -3534.750, 122.7475, 2.599249, 900, 0, 0, 0, 0, 2);

-- --------Pathing------------------------
SET @NPC := (@GUID + 0);
SET @PATH := @NPC * 10;
SET @POINT := 0;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 3496.611, -3304.485, 130.2477),
(@PATH, @POINT := @POINT + 1, 3501.017, -3320.939, 130.1988),
(@PATH, @POINT := @POINT + 1, 3516.886, -3321.310, 131.3028),
(@PATH, @POINT := @POINT + 1, 3533.510, -3325.740, 129.8950),
(@PATH, @POINT := @POINT + 1, 3563.853, -3333.576, 129.3590),
(@PATH, @POINT := @POINT + 1, 3587.316, -3335.419, 127.2169),
(@PATH, @POINT := @POINT + 1, 3555.287, -3343.082, 129.2272),
(@PATH, @POINT := @POINT + 1, 3541.950, -3368.319, 132.0300),
(@PATH, @POINT := @POINT + 1, 3539.138, -3390.615, 132.3763),
(@PATH, @POINT := @POINT + 1, 3546.026, -3421.109, 135.2656),
(@PATH, @POINT := @POINT + 1, 3528.616, -3392.653, 132.3763),
(@PATH, @POINT := @POINT + 1, 3519.140, -3387.130, 132.4560),
(@PATH, @POINT := @POINT + 1, 3493.885, -3381.469, 135.2286),
(@PATH, @POINT := @POINT + 1, 3456.239, -3378.636, 139.5714),
(@PATH, @POINT := @POINT + 1, 3419.620, -3378.933, 141.8746),
(@PATH, @POINT := @POINT + 1, 3456.239, -3378.636, 139.5714),
(@PATH, @POINT := @POINT + 1, 3493.732, -3381.419, 135.2316),
(@PATH, @POINT := @POINT + 1, 3519.140, -3387.130, 132.4560),
(@PATH, @POINT := @POINT + 1, 3528.616, -3392.653, 132.3763),
(@PATH, @POINT := @POINT + 1, 3546.026, -3421.109, 135.2656),
(@PATH, @POINT := @POINT + 1, 3539.138, -3390.615, 132.3763),
(@PATH, @POINT := @POINT + 1, 3541.950, -3368.319, 132.0300),
(@PATH, @POINT := @POINT + 1, 3555.287, -3343.082, 129.2272),
(@PATH, @POINT := @POINT + 1, 3587.316, -3335.419, 127.2169),
(@PATH, @POINT := @POINT + 1, 3563.853, -3333.576, 129.3590),
(@PATH, @POINT := @POINT + 1, 3533.510, -3325.740, 129.8950),
(@PATH, @POINT := @POINT + 1, 3516.886, -3321.310, 131.3028),
(@PATH, @POINT := @POINT + 1, 3501.017, -3320.939, 130.1988),
(@PATH, @POINT := @POINT + 1, 3496.611, -3304.485, 130.2477),
(@PATH, @POINT := @POINT + 1, 3480.393, -3307.106, 130.4128);

SET @NPC := (@GUID + 1);
SET @PATH := @NPC * 10;
SET @POINT := 0;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 3602.921, -3488.057, 135.8794),
(@PATH, @POINT := @POINT + 1, 3623.550, -3513.888, 136.9184),
(@PATH, @POINT := @POINT + 1, 3648.388, -3518.862, 136.6696),
(@PATH, @POINT := @POINT + 1, 3665.853, -3494.050, 136.3362),
(@PATH, @POINT := @POINT + 1, 3629.388, -3487.229, 137.5149),
(@PATH, @POINT := @POINT + 1, 3673.813, -3485.689, 135.8256),
(@PATH, @POINT := @POINT + 1, 3713.954, -3482.851, 129.7010),
(@PATH, @POINT := @POINT + 1, 3718.166, -3448.076, 129.3145),
(@PATH, @POINT := @POINT + 1, 3705.293, -3411.265, 132.1460),
(@PATH, @POINT := @POINT + 1, 3685.754, -3379.769, 129.8789),
(@PATH, @POINT := @POINT + 1, 3669.716, -3350.548, 125.2413),
(@PATH, @POINT := @POINT + 1, 3651.337, -3332.349, 123.5366),
(@PATH, @POINT := @POINT + 1, 3673.492, -3309.539, 126.4855),
(@PATH, @POINT := @POINT + 1, 3686.000, -3286.630, 128.0600),
(@PATH, @POINT := @POINT + 1, 3694.174, -3269.902, 127.8214),
(@PATH, @POINT := @POINT + 1, 3705.277, -3253.183, 127.0408),
(@PATH, @POINT := @POINT + 1, 3729.962, -3259.325, 127.9591),
(@PATH, @POINT := @POINT + 1, 3705.277, -3253.183, 127.0408),
(@PATH, @POINT := @POINT + 1, 3694.174, -3269.902, 127.8214),
(@PATH, @POINT := @POINT + 1, 3686.000, -3286.630, 128.0600),
(@PATH, @POINT := @POINT + 1, 3673.492, -3309.539, 126.4855),
(@PATH, @POINT := @POINT + 1, 3651.337, -3332.349, 123.5366),
(@PATH, @POINT := @POINT + 1, 3669.716, -3350.548, 125.2413),
(@PATH, @POINT := @POINT + 1, 3685.754, -3379.769, 129.8789),
(@PATH, @POINT := @POINT + 1, 3705.293, -3411.265, 132.1460),
(@PATH, @POINT := @POINT + 1, 3718.171, -3447.861, 129.3067),
(@PATH, @POINT := @POINT + 1, 3713.954, -3482.851, 129.7010),
(@PATH, @POINT := @POINT + 1, 3673.813, -3485.689, 135.8256),
(@PATH, @POINT := @POINT + 1, 3629.388, -3487.229, 137.5149),
(@PATH, @POINT := @POINT + 1, 3665.853, -3494.050, 136.3362),
(@PATH, @POINT := @POINT + 1, 3648.388, -3518.862, 136.6696),
(@PATH, @POINT := @POINT + 1, 3623.550, -3513.888, 136.9184),
(@PATH, @POINT := @POINT + 1, 3602.921, -3488.057, 135.8794),
(@PATH, @POINT := @POINT + 1, 3578.609, -3461.189, 135.2853);

SET @NPC := (@GUID + 2);
SET @POINT := 0;
SET @PATH := @NPC * 10;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES (@NPC,@PATH,0,0,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`) VALUES
(@PATH, @POINT := @POINT + 1, 4044.845, -3520.759, 121.6993),
(@PATH, @POINT := @POINT + 1, 4021.720, -3529.522, 122.2696),
(@PATH, @POINT := @POINT + 1, 3997.682, -3556.203, 124.7969),
(@PATH, @POINT := @POINT + 1, 3955.195, -3556.644, 129.8793),
(@PATH, @POINT := @POINT + 1, 3979.817, -3586.936, 127.6629),
(@PATH, @POINT := @POINT + 1, 3999.419, -3604.702, 129.5177),
(@PATH, @POINT := @POINT + 1, 4008.615, -3629.069, 129.3868),
(@PATH, @POINT := @POINT + 1, 3986.416, -3626.187, 130.1212),
(@PATH, @POINT := @POINT + 1, 3963.268, -3642.394, 133.2446),
(@PATH, @POINT := @POINT + 1, 3945.813, -3645.609, 137.4449),
(@PATH, @POINT := @POINT + 1, 3935.039, -3652.638, 139.9641),
(@PATH, @POINT := @POINT + 1, 3905.511, -3672.499, 139.0567),
(@PATH, @POINT := @POINT + 1, 3880.139, -3682.546, 142.2288),
(@PATH, @POINT := @POINT + 1, 3871.972, -3695.018, 142.4928),
(@PATH, @POINT := @POINT + 1, 3860.894, -3677.064, 143.4627),
(@PATH, @POINT := @POINT + 1, 3843.936, -3691.934, 142.8869),
(@PATH, @POINT := @POINT + 1, 3846.652, -3671.873, 144.1723),
(@PATH, @POINT := @POINT + 1, 3834.103, -3652.026, 145.6312),
(@PATH, @POINT := @POINT + 1, 3822.230, -3633.550, 146.1223),
(@PATH, @POINT := @POINT + 1, 3795.741, -3609.456, 145.2505),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3887.829, -3545.449, 137.7642),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3887.829, -3545.449, 137.7642),
(@PATH, @POINT := @POINT + 1, 3874.042, -3548.795, 137.3683),
(@PATH, @POINT := @POINT + 1, 3865.565, -3576.687, 140.8942),
(@PATH, @POINT := @POINT + 1, 3843.980, -3604.263, 144.5417),
(@PATH, @POINT := @POINT + 1, 3823.748, -3625.020, 145.5289),
(@PATH, @POINT := @POINT + 1, 3795.741, -3609.456, 145.2505),
(@PATH, @POINT := @POINT + 1, 3822.230, -3633.550, 146.1223),
(@PATH, @POINT := @POINT + 1, 3834.079, -3651.989, 145.6344),
(@PATH, @POINT := @POINT + 1, 3846.652, -3671.873, 144.1723),
(@PATH, @POINT := @POINT + 1, 3843.936, -3691.934, 142.8869),
(@PATH, @POINT := @POINT + 1, 3860.894, -3677.064, 143.4627),
(@PATH, @POINT := @POINT + 1, 3871.972, -3695.018, 142.4928),
(@PATH, @POINT := @POINT + 1, 3880.139, -3682.546, 142.2288),
(@PATH, @POINT := @POINT + 1, 3905.511, -3672.499, 139.0567),
(@PATH, @POINT := @POINT + 1, 3935.039, -3652.638, 139.9641),
(@PATH, @POINT := @POINT + 1, 3945.559, -3645.736, 137.5213),
(@PATH, @POINT := @POINT + 1, 3963.268, -3642.394, 133.2446),
(@PATH, @POINT := @POINT + 1, 3986.416, -3626.187, 130.1212),
(@PATH, @POINT := @POINT + 1, 4008.615, -3629.069, 129.3868),
(@PATH, @POINT := @POINT + 1, 3999.419, -3604.702, 129.5177),
(@PATH, @POINT := @POINT + 1, 3979.817, -3586.936, 127.6629),
(@PATH, @POINT := @POINT + 1, 3955.195, -3556.644, 129.8793),
(@PATH, @POINT := @POINT + 1, 3997.682, -3556.203, 124.7969),
(@PATH, @POINT := @POINT + 1, 4021.720, -3529.522, 122.2696),
(@PATH, @POINT := @POINT + 1, 4044.845, -3520.759, 121.6993),
(@PATH, @POINT := @POINT + 1, 4067.240, -3534.060, 122.5621);--
-- END UPDATING QUERIES
--
COMMIT;
END;
//
DELIMITER ;
CALL updateDb();
DROP PROCEDURE IF EXISTS `updateDb`;
