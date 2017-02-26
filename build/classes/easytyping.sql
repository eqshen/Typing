/*
Navicat MySQL Data Transfer

Source Server         : LocalMySQL
Source Server Version : 50703
Source Host           : localhost:3306
Source Database       : easytyping

Target Server Type    : MYSQL
Target Server Version : 50703
File Encoding         : 65001

Date: 2017-02-26 15:47:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) DEFAULT NULL,
  `content` text,
  `type` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `level` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '一生很短', '我们拥有最多的就是昨天，昨天里有宝贵的财富，有渊博的知识，有深刻的思想，\r\n有超人的智慧，有生活所必需的丰富的物质文明。\r\n昨天是历史，记录着我们生活的轨迹，成功和失败，光荣和耻辱，经验和教训，萎靡和辉煌。\r\n昨天像一个老师教育着我们指导着我们，使我们呼吸着智慧的空气。\r\n昨天是一面镜子，可以照见人间的美丑、是非、善恶。\r\n昨天像一位伟道者，告诉我们如何做人，指引我们步入高尚的道德殿堂。\r\n昨天告诉我们如何对待死亡，告诉我们如何获得新生。\r\n昨天让我们学会了回忆，学会了思考，学会了珍惜，学会了奋进，学会了取舍，让我们懂得了生死的含义。\r\n明天是没有尽头的时间隧道。明天是空旷的，飘渺的。\r\n但明天里充满了希望、梦想和期待。明天是神秘的。明天藏着无尽的宝藏，需要我们去挖掘；\r\n藏着无数的机遇，需要我们去把握；藏着意想不到的奇迹，等待我们去创造；\r\n挂着很多奇瓜异果，等待我们去采撷。所以明天是我们理想的高地，是我们幸福的乐园，\r\n是我们的极乐世界，是上帝赐予我们的天堂。明天也许才是我们生活的全部意义。\r\n没有明天，昨天就会成为废墟，没有明天，今天就成了尽头。\r\n今天是短暂的，是飘忽不定的，是浮躁不安的，是变化无常的，是稍纵即逝的。\r\n但今天又是最现实的，最明朗的，我们才可能造就庞大厚实的昨天，也才能拥有辉煌灿烂的明天。\r\n昨天是基础，今天是行动，明天是计划。没有今天，昨天就不会进步，计划的明天就会落空。\r\n没有今天，我们就驶不出昨天的港湾，就达不到明天的彼岸。\r\n海明威说，我只有对第二天要干什么心中有数时，才能休息。\r\n如果是这样，昨天里就有了设置好的今天，今天里就了设置好的明天。\r\n我们的今天已经带着昨天，也装着明天。\r\n昨天是永远存在的，今天和明天终究有一天会不再和我们相遇，我们会定格在一个固定的昨天里。\r\n我们注定要活在今天，梦在明天，死在昨天。所以昨天是我们真正的归宿。\r\n我们只有知道了昨天，懂得了明天，才可能知道今天是什么。\r\n人的一生只有三天昨天，今天与明天。昨天属于过去，只是一段回忆；\r\n今天属于现在，需要我们去珍惜；明天属于未来，让我们寄托希望。', 'chinese', '1', 'public');
INSERT INTO `article` VALUES ('2', 'English Article', 'I am the only child in my family, so my parents give me all the things. I am so gratitude, but I want to do something for them, I want to feel that I can be helpful. So I ask my parents what I can do for them, they are so happy. My mother asks me to help her with the housework and my father asks me to watch the football game with him. ', 'english', '1', 'public');
INSERT INTO `article` VALUES ('3', '背影-朱自清(部分)', '我说道，“爸爸，你走吧。”他望车外看了看说：“我买几个橘子去。你就在此地，不要走动。”我看那边月台的栅栏外有几个卖东西的等着顾客。走到那边月台，须穿过铁道，须跳下去又爬上去。父亲是一个胖子，走过去自然要费事些。我本来要去的，他不肯，只好让他去。我看见他戴着黑布小帽，穿着黑布大马褂，深青布棉袍，蹒跚地走到铁道边，慢慢探身下去，尚不大难。可是他穿过铁道，要爬上那边月台，就不容易了。他用两手攀着上面，两脚再向上缩；他肥胖的身子向左微倾，显出努力的样子。这时我看见他的背影，我的泪很快地流下来了。我赶紧拭干了泪。怕他看见，也怕别人看见。我再向外看时，他已抱了朱红的橘子往回走了。过铁道时，他先将橘子散放在地上，自己慢慢爬下，再抱起橘子走。到这边时，我赶紧去搀他。他和我走到车上，将橘子一股脑儿放在我的皮大衣上。于是扑扑衣上的泥土，心里很轻松似的。过一会说：“我走了，到那边来信！”我望着他走出去。他走了几步，回过头看见我，说：“进去吧，里边没人。”等他的背影混入来来往往的人里，再找不着了，我便进来坐下，我的眼泪又来了。', 'chinese', '1', 'public');
INSERT INTO `article` VALUES ('4', 'Anne\'s best friend', 'Do you want a friend whom you could tell everything to,like your deepest feelings and thoughts?Or are you afraid that your friend would laugh at you ,or would not understand what you are going through?Anne Frank wanted the first kind ,so she made her diary her best friend.Anne lived in Amsterdam in the Netherlands during World War II.Her family was Jewish so they had to hide or they would be caugh by German Nazis.She and he family hid away for nearly twenty-five months before they were discovered.During that time the only ture friend was her diary.She said,\"I don\'t want to set down a series of facts in a diary as most people do,but I want this diary itseft to bee my friend, and I shall call my friend Kitty.\"Now read how she felt after being in the hiding place since July 1942.Thursday 15th June,1944.Dear Killy,I wonder if it\'s because I haven\'t been able to be outdoors for so long that I\'ve grown so crazy about everything to do with nature.I can well remeber that there was a time when a deep blue sky ,the song of the birds,moonlight and flowers could never have kept me spellbould.That\'s changed since I was here....For example,one evening when it was so warm,I stayed awake on purpose until half past eleven in order to have a good look at the moon by myself.But as the moon gave far too much light,I didn\'t dare open a window.Another time five months ago,I happened to be upstairs at dark when the window was open.I didn\'t go downstairs until the window had to be shut.The dark,rainy evening,the wind,the thundering clouds held me entirely in their power;it was the first time in a year and a half that I\'d seen the night face to face......sadly...I am only able to look at nature thought ditly curtains hanging brfore very dusty windows.It\'s no pleasure looking thought these any longer because nature is one thing that really must be experienced.Yours,Anne.', 'english', '1', 'public');
INSERT INTO `article` VALUES ('5', 'We Have Only One World', 'When industries grow, pollution also grows. Today the problem of environment has become more and more important. The world population is rising so quickly that the world has become too crowded. We are using up our natural resources too quickly and at the same time we are polluting our environment with dangerous chemicals. If we don’t take action immediately, then we will destroy our only world.Man has made great progress in environment protection. Government of many countries has established laws to protect the forest and sea resource and to stop the environmental pollution.Still more measures should be taken to solve the problem. First, we should start by educating the public about the hazards of pollution. The government on its part should also design stricter laws. This is not only for our own generation but also for the future generation to come.It is necessary to protect our nature environment. We must begin now to protect our only world.', 'english', '1', 'public');
INSERT INTO `article` VALUES ('6', 'Try to Be a Good Student', 'Perhaps it is the dream of everyone to be a good student at school, but quite a few students feel at a loss on how to make it. In my opinion it is rather easy if you can act on the following points.First of all, make full use of your time and work hard. Don’t put off till tomorrow what should be done today, as time past will never come back. The fast developing society requires adequate knowledge, which presses us to spare no efforts to study. Of course, your hard work will be rewarded one day.Secondly, use your own head and present your point of view. Credulous attitude will only make you take anything for granted. With your own judgment you will be able to tell right from wrong and set up your own theory.Thirdly, set aside enough time for relaxation, entertainment, etc. don’t ignore the harm of all work and no play. Proper sports will build up your body and improve the efficiency of your studying.To be a good student is easier said than done, for it needs a student’s consistent efforts. But nothing is difficult to a man if he puts his heart into it.', 'english', '1', 'public');
INSERT INTO `article` VALUES ('7', 'The Way to Achieve Success', 'Many people say that they owe much of it to the cultivation of certain good habits in early life. In forming good habits, I think we should pay attention to four things, that is honesty, industry, enthusiasm and thrift.“Honesty is the best policy.” This is a proverb to which we must pay attention. There are so many temptations in society that through a little carelessness we may go astray. But when we are honest, people will not be dishonest to us.Industry gives every man and woman, every boy and girl, proper work to do. To do nothing is going to ruin oneself.Enthusiasm is a great force. One’s soul will expand if one devotes oneself to a noble cause. The difficulties in our way are tremendous, but what can we not accomplish, if with enthusiasm?There are many proverbs, which set forth the advantages of thrift. Since we live in the world in which money is a very powerful thing, we should always try to save a portion of our earnings for future use.These are the four things to which we must pay attention. It is only by this way that we can achieve success.', 'english', '1', 'public');
INSERT INTO `article` VALUES ('8', '取得成功之路', '很多人说，他们欠一大部分用于某些良好习惯的培养在早期的生活。在形成良好的习惯，我认为我们应该注意的四件事情，就是诚实，勤劳，热情，节俭。“诚实是最好的政策。”这是一个俗语，我们必须注意。在社会上有这么多的诱惑，通过一个小疏忽，我们可能会误入歧途。但是，当我们是诚实的，人们不会对我们是不诚实的。行业让每个男人和女人，每一个男孩和女孩，适当的工作要做。什么也不做会毁了自己。热情是一个伟大的力量。一个人的灵魂，如果一个致力于将扩大自己一个崇高的事业。在我们这样的困难是巨大的，但我们不能完成的，如果与热情?有许多谚语，其中确定了节俭的优点。因为我们在这个世界上，钱是一个非常强大的东西生活，我们应该始终尝试保存供日后使用我们的盈利部分。这是四件事情是我们必须注意。因为只有这样，我们才能取得成功。', 'chinese', '1', 'public');
INSERT INTO `article` VALUES ('9', 'The Force of Habits', 'Habits, whether good or bad, are gradually formed. The more we do a thing, the more we tend to like doing it; and if we do not continue to do it, we feel uncomfortable. This is called the force of habits, and the force of habits should be fought against.This applies even to such good things as work or rest. Some people form a bad habit of working too much, and others of idling too much. Bad habits, once formed, are difficult to get rid of.The wise man always remembers to check any bad habit. He warns himself \"I am now becoming idle\" or \"I like too many sweets\" or \"I smoke too much\". And then adds, \"I will get myself out of this bad habit at once.\"', 'english', '1', 'public');
INSERT INTO `article` VALUES ('10', '童趣（文言文）', '余忆童稚时，能张目对日，明察秋毫，见藐小之物必细察其纹理，故时有物外之趣。夏蚊成雷，私拟作群鹤舞于空中，心之所向，则或千或百，果然鹤也；昂首观之，项为之强。又留蚊于素帐中，徐喷以烟，使之冲烟而飞鸣，作青云白鹤观，果如鹤唳云端，为之怡然称快。余常于土墙凹凸处，花台小草丛杂处，蹲其身，使与台齐；定神细视，以丛草为林，以虫蚁为兽，以土砾凸者为丘，凹者为壑，神游其中，怡然自得。一日，见二虫斗草间，观之，兴正浓，忽有庞然大物，拔山倒树而来，盖一癞蛤蟆，舌一吐而二虫尽为所吞。余年幼，方出神，不觉呀然一惊。神定，捉虾蟆，鞭数十，驱之别院。', 'chinese', '1', 'public');
INSERT INTO `article` VALUES ('11', '中文打字测试文章', '这是一篇中文打字测试文章，文章字数不多，便于测试。我是EQShen，即沈恩强，这是我学习过程中完成的一个小小作品，谢谢您的使用。', 'chinese', '1', 'public');
INSERT INTO `article` VALUES ('12', 'The English Test Article', 'This is a project made by eqshen (no body know who is he,but he is hard working . This project is quiet simple,but he do this....hs is a green hand)', 'english', '1', 'public');

-- ----------------------------
-- Table structure for no_regisiteruser
-- ----------------------------
DROP TABLE IF EXISTS `no_regisiteruser`;
CREATE TABLE `no_regisiteruser` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1021 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of no_regisiteruser
-- ----------------------------
INSERT INTO `no_regisiteruser` VALUES ('1015', 'T446817859901238726', '游客1000', '1');
INSERT INTO `no_regisiteruser` VALUES ('1016', 'T446819782053977335', '游客1001', '1');
INSERT INTO `no_regisiteruser` VALUES ('1017', 'T448086637511573675', '游客1002', '1');
INSERT INTO `no_regisiteruser` VALUES ('1018', 'T451888038462477327', '游客1003', '1');
INSERT INTO `no_regisiteruser` VALUES ('1019', 'T451889499651391863', '游客1004', '1');
INSERT INTO `no_regisiteruser` VALUES ('1020', 'T488093287444595207', '游客1005', '1');

-- ----------------------------
-- Table structure for typerecord
-- ----------------------------
DROP TABLE IF EXISTS `typerecord`;
CREATE TABLE `typerecord` (
  `userid` varchar(100) DEFAULT NULL,
  `timeuse` int(11) DEFAULT NULL,
  `rightwords` int(11) DEFAULT NULL,
  `wrongwords` int(11) DEFAULT NULL,
  `backwords` int(11) DEFAULT NULL,
  `typespeed` int(11) DEFAULT NULL,
  `keyspeed` int(11) DEFAULT NULL,
  `rightPercent` float DEFAULT NULL,
  `date` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of typerecord
-- ----------------------------

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` varchar(50) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('1001', '10000', 'hendy', '123456', '87026928@qq.com', '1');
