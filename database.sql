-- DROP DATABASE IF EXISTS `crafting-cost-estimator`;
-- CREATE DATABASE 'crafting-cost-estimator';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `materials`;
CREATE TABLE `materials` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT "",
        `cost`  FLOAT           NOT NULL DEFAULT 1000000
) ENGINE InnoDB;

INSERT INTO `materials` SET `id` = 1, `name` = 'Ancestor Silk';
INSERT INTO `materials` SET `id` = 2, `name` = 'Rubedo Leather';
INSERT INTO `materials` SET `id` = 3, `name` = 'Rubedite Ingot';
INSERT INTO `materials` SET `id` = 4, `name` = 'Sanded Ruby Ash';
INSERT INTO `materials` SET `id` = 5, `name` = 'Platinum Ingot';
INSERT INTO `materials` SET `id` = 6, `name` = 'Hemming';
INSERT INTO `materials` SET `id` = 7, `name` = 'Embroidery';
INSERT INTO `materials` SET `id` = 8, `name` = 'Elegant Lining';
INSERT INTO `materials` SET `id` = 9, `name` = 'Dreugh Wax';
INSERT INTO `materials` SET `id` = 10, `name` = 'Pitch';
INSERT INTO `materials` SET `id` = 11, `name` = 'Turpen';
INSERT INTO `materials` SET `id` = 12, `name` = 'Mastic';
INSERT INTO `materials` SET `id` = 13, `name` = 'Rosin';
INSERT INTO `materials` SET `id` = 14, `name` = 'Terne Plating';
INSERT INTO `materials` SET `id` = 15, `name` = 'Iridium Plating';
INSERT INTO `materials` SET `id` = 16, `name` = 'Zircon Plating';
INSERT INTO `materials` SET `id` = 17, `name` = 'Chromium Plating';
INSERT INTO `materials` SET `id` = 18, `name` = 'Quartz';
INSERT INTO `materials` SET `id` = 19, `name` = 'Diamond';
INSERT INTO `materials` SET `id` = 20, `name` = 'Sardonyx';
INSERT INTO `materials` SET `id` = 21, `name` = 'Almandine';
INSERT INTO `materials` SET `id` = 22, `name` = 'Emerald';
INSERT INTO `materials` SET `id` = 23, `name` = 'Bloodstone';
INSERT INTO `materials` SET `id` = 24, `name` = 'Garnet';
INSERT INTO `materials` SET `id` = 25, `name` = 'Sapphire';
INSERT INTO `materials` SET `id` = 26, `name` = 'Fortified Nirncrux';
INSERT INTO `materials` SET `id` = 27, `name` = 'Chrysolite';
INSERT INTO `materials` SET `id` = 28, `name` = 'Amethyst';
INSERT INTO `materials` SET `id` = 29, `name` = 'Ruby';
INSERT INTO `materials` SET `id` = 30, `name` = 'Jade';
INSERT INTO `materials` SET `id` = 31, `name` = 'Turquoise';
INSERT INTO `materials` SET `id` = 32, `name` = 'Carnelian';
INSERT INTO `materials` SET `id` = 33, `name` = 'Fire Opal';
INSERT INTO `materials` SET `id` = 34, `name` = 'Citrine';
INSERT INTO `materials` SET `id` = 35, `name` = 'Potent Nirncrux';
INSERT INTO `materials` SET `id` = 36, `name` = 'Zinc';
INSERT INTO `materials` SET `id` = 37, `name` = 'Antimony';
INSERT INTO `materials` SET `id` = 38, `name` = 'Cobalt';
INSERT INTO `materials` SET `id` = 39, `name` = 'Slaughterstone';
INSERT INTO `materials` SET `id` = 40, `name` = 'Dibellium';
INSERT INTO `materials` SET `id` = 41, `name` = 'Aurbic Amber';
INSERT INTO `materials` SET `id` = 42, `name` = 'Titanium';
INSERT INTO `materials` SET `id` = 43, `name` = 'Gilding Wax';
INSERT INTO `materials` SET `id` = 44, `name` = 'Dawn-prism';
INSERT INTO `materials` SET `id` = 45, `name` = 'Honing Stone';
INSERT INTO `materials` SET `id` = 46, `name` = 'Dwarven Oil';
INSERT INTO `materials` SET `id` = 47, `name` = 'Grain Solvent';
INSERT INTO `materials` SET `id` = 48, `name` = 'Tempering Alloy';
INSERT INTO `materials` SET `id` = 49, `name` = 'Hemming';
INSERT INTO `materials` SET `id` = 50, `name` = 'Embroidery';
INSERT INTO `materials` SET `id` = 51, `name` = 'Elegant Lining';
INSERT INTO `materials` SET `id` = 52, `name` = 'Dreugh Wax';
INSERT INTO `materials` SET `id` = 53, `name` = 'Pitch';
INSERT INTO `materials` SET `id` = 54, `name` = 'Turpen';
INSERT INTO `materials` SET `id` = 55, `name` = 'Mastic';
INSERT INTO `materials` SET `id` = 56, `name` = 'Rosin';
INSERT INTO `materials` SET `id` = 57, `name` = 'Terne Plating';
INSERT INTO `materials` SET `id` = 58, `name` = 'Iridium Plating';
INSERT INTO `materials` SET `id` = 59, `name` = 'Zircon Plating';
INSERT INTO `materials` SET `id` = 60, `name` = 'Chromium Plating';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `armor_types`;
CREATE TABLE `armor_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL
) ENGINE InnoDB;

INSERT INTO `armor_types` SET `id` = 1, `name` = 'Light';
INSERT INTO `armor_types` SET `id` = 2, `name` = 'Medium';
INSERT INTO `armor_types` SET `id` = 3, `name` = 'Heavy';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `crafting_types`;
CREATE TABLE `crafting_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT ""
) ENGINE InnoDB;

INSERT INTO `crafting_types` SET `id` = 1, `name` = 'Clothier';
INSERT INTO `crafting_types` SET `id` = 2, `name` = 'Woodworking';
INSERT INTO `crafting_types` SET `id` = 3, `name` = 'Blacksmithing';
INSERT INTO `crafting_types` SET `id` = 4, `name` = 'Jewelry Crafting';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `item_types`;
CREATE TABLE `item_types` (
        `id`    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`  CHAR(32)        NOT NULL DEFAULT ""
) ENGINE InnoDB;

INSERT INTO `item_types` SET `id` = 1, `name` = 'Weapon';
INSERT INTO `item_types` SET `id` = 2, `name` = 'Armor';
INSERT INTO `item_types` SET `id` = 3, `name` = 'Jewelry';

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `traits`;
CREATE TABLE `traits` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT "",
        `description`           CHAR(255)       NOT NULL DEFAULT "",
        `material_id`           INT             NOT NULL,
        `item_type_id`          INT             NOT NULL,
        FOREIGN KEY (`material_id`)     REFERENCES `materials` (`id`),
        FOREIGN KEY (`item_type_id`)    REFERENCES `item_types` (`id`)
) ENGINE InnoDB;

INSERT INTO `traits` SET `id` = 1, `name` = 'Sturdy', `description` = 'Reduces the cost of Block.', `material_id` = 18, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 2, `name` = 'Impenetrable', `description` = 'Increases Critical Resistance and this item takes 50% less durability damage.', `material_id` = 19, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 3, `name` = 'Reinforced', `description` = 'Increases Armor value.', `material_id` = 20, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 4, `name` = 'Well-fitted', `description` = 'Reduces the cost of Roll Dodge and Sprint.', `material_id` = 21, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 5, `name` = 'Training', `description` = 'Increase experience gained from kills.', `material_id` = 22, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 6, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 23, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 7, `name` = 'Invigorating', `description` = 'Increases Health, Magicka, and Stamina Recovery.', `material_id` = 24, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 8, `name` = 'Divines', `description` = 'Increases Mundus Stone effects.', `material_id` = 25, `item_type_id` = 2;
INSERT INTO `traits` SET `id` = 9, `name` = 'Nirnhoned', `description` = 'Increases Physical and Spell Resistance.', `material_id` = 26, `item_type_id` = 2;

INSERT INTO `traits` SET `id` = 10, `name` = 'Powered', `description` = 'Increases healing done.', `material_id` = 27, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 11, `name` = 'Charged', `description` = 'Increases chance to apply a status effect to your target.', `material_id` = 28, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 12, `name` = 'Precise', `description` = 'Increases Weapon and Spell Critical.', `material_id` = 29, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 13, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 30, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 14, `name` = 'Defending', `description` = 'Increases physical and spell resistance.', `material_id` = 31, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 15, `name` = 'Training', `description` = 'Increases experience from kills.', `material_id` = 32, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 16, `name` = 'Sharpened', `description` = 'Increases your Physical and Spell Penetration.', `material_id` = 33, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 17, `name` = 'Decisive', `description` = 'When you gain Ultimate you have a chance to gain 1 additional Ultimate.', `material_id` = 34, `item_type_id` = 1;
INSERT INTO `traits` SET `id` = 18, `name` = 'Nirnhoned', `description` = 'Increases damage of this weapon.', `material_id` = 35, `item_type_id` = 1;

INSERT INTO `traits` SET `id` = 19, `name` = 'Robust', `description` = 'Increases Maximum Stamina.', `material_id` = 36, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 20, `name` = 'Healthy', `description` = 'Increases Maximum Health.', `material_id` = 37, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 21, `name` = 'Arcane', `description` = 'Increases Maximum Magicka.', `material_id` = 38, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 22, `name` = 'Bloodthirsty', `description` = 'Increases Weapon and Spell Damage.', `material_id` = 39, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 23, `name` = 'Harmony', `description` = 'Increases damage, healing, resource restore, and damage shield strength of synergies you activate.', `material_id` = 40, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 24, `name` = 'Infused', `description` = 'Increases enchantment effects of this item.', `material_id` = 41, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 25, `name` = 'Protective', `description` = 'Increases Physical and Spell Resistance.', `material_id` = 42, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 26, `name` = 'Swift', `description` = 'Increases movement speed.', `material_id` = 43, `item_type_id` = 3;
INSERT INTO `traits` SET `id` = 27, `name` = 'Triune', `description` = 'Increases Maximum Magicka, Stamina, and Health.', `material_id` = 44, `item_type_id` = 3;

-- -----------------------------------------------------------------------------

DROP TABLE IF EXISTS `items`;
CREATE TABLE `items` (
        `id`                    INT             AUTO_INCREMENT PRIMARY KEY,
        `name`                  CHAR(32)        NOT NULL DEFAULT "",
        `material_id`           INT             NOT NULL,
        `num_materials`         INT             NOT NULL,
        `item_type_id`          INT             NOT NULL,
        `crafting_type_id`      INT             NOT NULL,
        `armor_type_id`         INT             DEFAULT NULL,
        KEY `craft_item` (`item_type_id`, `crafting_type_id`),
        FOREIGN KEY (`material_id`)             REFERENCES `materials` (`id`),
        FOREIGN KEY (`item_type_id`)            REFERENCES `item_types` (`id`),
        FOREIGN KEY (`crafting_type_id`)        REFERENCES `crafting_types` (`id`),
        FOREIGN KEY (`armor_type_id`)           REFERENCES `armor_types` (`id`)
) ENGINE InnoDB;

INSERT INTO `items` SET `id` = 1, `num_materials` = 150, `name` = 'Cuirass', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 2, `num_materials` = 130, `name` = 'Sabatons', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 3, `num_materials` = 130, `name` = 'Gauntlets', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 4, `num_materials` = 130, `name` = 'Helm', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 5, `num_materials` = 140, `name` = 'Greaves', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 6, `num_materials` = 130, `name` = 'Pauldron', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;
INSERT INTO `items` SET `id` = 7, `num_materials` = 130, `name` = 'Girdle', `material_id` = 3, `item_type_id` = 2, `crafting_type_id` = 3, `armor_type_id` = 3;

INSERT INTO `items` SET `id` = 8, `num_materials` = 150, `name` = 'Jack', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 9, `num_materials` = 130, `name` = 'Bracers', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 10, `num_materials` = 130, `name` = 'Belt', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 11, `num_materials` = 140, `name` = 'Guards', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 12, `num_materials` = 130, `name` = 'Boots', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 13, `num_materials` = 130, `name` = 'Helmet', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;
INSERT INTO `items` SET `id` = 14, `num_materials` = 130, `name` = 'Arm Cops', `material_id` = 2, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 2;

INSERT INTO `items` SET `id` = 15, `num_materials` = 150, `name` = 'Robe', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 16, `num_materials` = 130, `name` = 'Jerkin', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 17, `num_materials` = 130, `name` = 'Gloves', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 18, `num_materials` = 140, `name` = 'Sash', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 19, `num_materials` = 130, `name` = 'Breeches', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 20, `num_materials` = 130, `name` = 'Shoes', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 21, `num_materials` = 130, `name` = 'Hat', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;
INSERT INTO `items` SET `id` = 22, `num_materials` = 130, `name` = 'Epaulets', `material_id` = 1, `item_type_id` = 2, `crafting_type_id` = 1, `armor_type_id` = 1;

INSERT INTO `items` SET `id` = 23, `num_materials` = 110, `name` = 'Axe', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 24, `num_materials` = 110, `name` = 'Mace', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 25, `num_materials` = 110, `name` = 'Sword', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 26, `num_materials` = 140, `name` = 'Battle Axe', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 27, `num_materials` = 140, `name` = 'Maul', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 28, `num_materials` = 140, `name` = 'Greatsword', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;
INSERT INTO `items` SET `id` = 29, `num_materials` = 100, `name` = 'Dagger', `material_id` = 3, `item_type_id` = 1, `crafting_type_id` = 3;

INSERT INTO `items` SET `id` = 30, `num_materials` = 120, `name` = 'Bow', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 31, `num_materials` = 120, `name` = 'Lightning Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 32, `num_materials` = 120, `name` = 'Ice Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 33, `num_materials` = 120, `name` = 'Inferno Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;
INSERT INTO `items` SET `id` = 34, `num_materials` = 120, `name` = 'Healing Staff', `material_id` = 4, `item_type_id` = 1, `crafting_type_id` = 2;

INSERT INTO `items` SET `id` = 35, `num_materials` = 160, `name` = 'Shield', `material_id` = 4, `item_type_id` = 2, `crafting_type_id` = 2;

INSERT INTO `items` SET `id` = 36, `num_materials` = 150, `name` = 'Necklace', `material_id` = 5, `item_type_id` = 3, `crafting_type_id` = 4;
INSERT INTO `items` SET `id` = 37, `num_materials` = 100, `name` = 'Ring', `material_id` = 5, `item_type_id` = 3, `crafting_type_id` = 4;
