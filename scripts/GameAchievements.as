package
{
   import com.adobe.utils.StringUtil;
   import fl.lang.Locale;
   import flash.net.SharedObject;
   
   public class GameAchievements
   {
       
      
      private var towerBuilded:int;
      
      public var easyTowerBuilder:Boolean;
      
      public var mediumTowerBuilder:Boolean;
      
      public var hardTowerBuilder:Boolean;
      
      public var earn15Stars:Boolean;
      
      public var earn30Stars:Boolean;
      
      public var earn45Stars:Boolean;
      
      public var whatsThat:Boolean;
      
      private var notificationEnemy:int;
      
      private var earlyWavesCalled:int;
      
      public var daring:Boolean;
      
      public var towerUpgradeLevel3:Boolean;
      
      private var magesTowerUpgradeLevel3:int;
      
      private var archersTowerUpgradeLevel3:int;
      
      private var soldiersTowerUpgradeLevel3:int;
      
      private var engineersTowerUpgradeLevel3:int;
      
      private var killedEnemies:int;
      
      public var firstBlood:Boolean;
      
      public var bloodlust:Boolean;
      
      public var mageBeamMeUp:Boolean;
      
      private var mageBeamMeUpEnemies:int;
      
      public var armaggedon:Boolean;
      
      private var fireballKills:int;
      
      public var deathFromAbove:Boolean;
      
      public var killMountainBoss:Boolean;
      
      public var killJuggernaut:Boolean;
      
      public var slayer:Boolean;
      
      public var specialization:Boolean;
      
      private var buildRangers:int = 0;
      
      private var buildMusketeers:int = 0;
      
      private var buildPaladins:int = 0;
      
      private var buildBarbarians:int = 0;
      
      private var buildArcanes:int = 0;
      
      private var buildSorcerers:int = 0;
      
      private var buildBfg:int = 0;
      
      private var buildTesla:int = 0;
      
      private var rallyChanges:int = 0;
      
      public var tactician:Boolean;
      
      public var killEndBoss:Boolean;
      
      private var soldiersTrained:int;
      
      private var soldiersKilled:int;
      
      private var soldiersRegeneration:int;
      
      public var multiKill:Boolean;
      
      public var giJoe:Boolean;
      
      public var dieHard:Boolean;
      
      public var cannonFodder:Boolean;
      
      public var fearless:Boolean;
      
      private var sellTowers:int;
      
      private var sunrayShots:int;
      
      public var realEstate:Boolean;
      
      public var indecisive:Boolean;
      
      public var impatient:Boolean;
      
      public var maxElves:Boolean;
      
      public var imperialSaviour:Boolean;
      
      public var henderson:Boolean;
      
      public var sunburner:Boolean;
      
      public var desintegrateKills:int;
      
      public var polymorphKills:int;
      
      public var missilesFire:int;
      
      public var poisonKills:int;
      
      public var sniperKills:int;
      
      public var axesFire:int;
      
      public var dustToDust:Boolean;
      
      public var shepard:Boolean;
      
      public var rocketeer:Boolean;
      
      public var toxicity:Boolean;
      
      public var sniper:Boolean;
      
      public var axeRainer:Boolean;
      
      public var thornsEnemies:int;
      
      public var energyNetwork:Boolean;
      
      public var elementalist:Boolean;
      
      public var entangled:Boolean;
      
      public var barbarianRush:Boolean;
      
      public var clustersFire:int;
      
      public var acdcKills:int;
      
      public var paladinHeals:int;
      
      public var holyChorusCount:int;
      
      public var sheepsKilled:int;
      
      public var clusterRain:Boolean;
      
      public var acdc:Boolean;
      
      public var medic:Boolean;
      
      public var holyChorus:Boolean;
      
      public var fisherman:Boolean;
      
      public var sheepKiller:Boolean;
      
      public var greatDefender:Boolean;
      
      public var greatDefenderHeroic:Boolean;
      
      public var greatDefenderIron:Boolean;
      
      public var killSarelgaz:Boolean;
      
      public var freeFredo:Boolean;
      
      public var killGulThak:Boolean;
      
      public var killGreenmuk:Boolean;
      
      public var heroMedium:Boolean;
      
      public var heroHard:Boolean;
      
      public var killBanditLord:Boolean;
      
      public var game:Game;
      
      public function GameAchievements(param1:Game)
      {
         super();
         this.game = param1;
      }
      
      private function §_-Oc§(param1:Level, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:AchievementItem = null;
         this.saveData();
         if(param1.§_-NX§ == null || param1.§_-NX§.fadeTimeCounter < 30)
         {
            param1.game.gameSounds.§_-E§();
            _loc5_ = new AchievementItem(param1,param2,param3,param4);
            param1.bullets.addChild(_loc5_);
            param1.§_-NX§ = _loc5_;
         }
      }
      
      public function §_-Ky§(param1:Level) : void
      {
         this.mageBeamMeUpEnemies++;
         if(!this.mageBeamMeUp && this.mageBeamMeUpEnemies >= 250)
         {
            this.mageBeamMeUp = true;
            this.§_-Oc§(param1,"beam_me_up",Locale.loadStringEx("ACHIEVEMENT_BEAM_ME_UP_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_BEAM_ME_UP_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function §_-Qs§(param1:Level) : void
      {
         this.earlyWavesCalled++;
         if(!this.daring && this.earlyWavesCalled == 10)
         {
            this.daring = true;
            this.§_-Oc§(param1,"daring",Locale.loadStringEx("ACHIEVEMENT_DARING_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DARING_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function killEnemie(param1:Level, param2:String) : void
      {
         this.killedEnemies++;
         if(!this.firstBlood)
         {
            this.firstBlood = true;
            this.§_-Oc§(param1,"first_blood",Locale.loadStringEx("ACHIEVEMENT_FIRST_BLOOD_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_FIRST_BLOOD_DESCRIPTION",Locale.getDefaultLang()));
         }
         if(!this.bloodlust && this.killedEnemies == 500)
         {
            this.bloodlust = true;
            this.§_-Oc§(param1,"bloodlust",Locale.loadStringEx("ACHIEVEMENT_BLOODLUST_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_BLOODLUST_DESCRIPTION",Locale.getDefaultLang()));
         }
         if(!this.slayer && this.killedEnemies == 2500)
         {
            this.slayer = true;
            this.§_-Oc§(param1,"slayer",Locale.loadStringEx("ACHIEVEMENT_SLAYER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SLAYER_DESCRIPTION",Locale.getDefaultLang()));
         }
         if(!this.multiKill && this.killedEnemies == 10000)
         {
            this.multiKill = true;
            this.§_-Oc§(param1,"terminator",Locale.loadStringEx("ACHIEVEMENT_MULTIKILL_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_MULTIKILL_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function buildTower(param1:Level, param2:String) : void
      {
         this.towerBuilded++;
         if(!this.easyTowerBuilder && this.towerBuilded == 30)
         {
            this.easyTowerBuilder = true;
            this.§_-Oc§(param1,"constructor",Locale.loadStringEx("ACHIEVEMENT_EASY_TOWER_BUILDER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_EASY_TOWER_BUILDER_DESCRIPTION",Locale.getDefaultLang()));
         }
         if(!this.mediumTowerBuilder && this.towerBuilded == 100)
         {
            this.mediumTowerBuilder = true;
            this.§_-Oc§(param1,"engineer",Locale.loadStringEx("ACHIEVEMENT_MEDIUM_TOWER_BUILDER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_MEDIUM_TOWER_BUILDER_DESCRIPTION",Locale.getDefaultLang()));
         }
         if(!this.hardTowerBuilder && this.towerBuilded == 150)
         {
            this.hardTowerBuilder = true;
            this.§_-Oc§(param1,"the_architect",Locale.loadStringEx("ACHIEVEMENT_HARD_TOWER_BUILDER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_HARD_TOWER_BUILDER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function upgradeTowerLevel3(param1:Level, param2:String) : void
      {
         switch(param2)
         {
            case "archer":
               this.archersTowerUpgradeLevel3 = this.archersTowerUpgradeLevel3 + 1;
               break;
            case "soldier":
               this.soldiersTowerUpgradeLevel3 = this.soldiersTowerUpgradeLevel3 + 1;
               break;
            case "mage":
               this.magesTowerUpgradeLevel3 = this.magesTowerUpgradeLevel3 + 1;
               break;
            case "engineer":
               this.engineersTowerUpgradeLevel3 = this.engineersTowerUpgradeLevel3 + 1;
         }
         if(!this.towerUpgradeLevel3 && this.archersTowerUpgradeLevel3 != 0 && this.soldiersTowerUpgradeLevel3 != 0 && this.magesTowerUpgradeLevel3 != 0 && this.engineersTowerUpgradeLevel3 != 0)
         {
            this.towerUpgradeLevel3 = true;
            this.§_-Oc§(param1,"home_improvement",Locale.loadStringEx("ACHIEVEMENT_UPGRADE_LEVEL3_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_UPGRADE_LEVEL3_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function viewNotification(param1:Level, param2:String) : void
      {
         if(StringUtil.beginsWith(param2,"NotificationEnemy"))
         {
            this.notificationEnemy++;
            if(!this.whatsThat && this.notificationEnemy == 10)
            {
               this.whatsThat = true;
               this.§_-Oc§(param1,"whats_that",Locale.loadStringEx("ACHIEVEMENT_WHATS_THAT_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_WHATS_THAT_DESCRIPTION",Locale.getDefaultLang()));
            }
         }
      }
      
      public function defeatJuggernaut(param1:Level) : void
      {
         if(!this.killJuggernaut)
         {
            this.killJuggernaut = true;
            this.§_-Oc§(param1,"nuts_and_bolts",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_JUGGERNAUT_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_JUGGERNAUT_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function defeatYetiBoss(param1:Level) : void
      {
         if(!this.killMountainBoss)
         {
            this.killMountainBoss = true;
            this.§_-Oc§(param1,"kill_him_yeti",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_MOUNTAIN_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_MOUNTAIN_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function defeatEndBoss(param1:Level) : void
      {
         if(!this.killEndBoss)
         {
            this.killEndBoss = true;
            this.§_-Oc§(param1,"defeat_end_boss",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_END_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_END_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function trainSoldier(param1:Level) : void
      {
         this.soldiersTrained++;
         if(!this.giJoe && this.soldiersTrained == 1000)
         {
            this.giJoe = true;
            this.§_-Oc§(param1,"gi_joe",Locale.loadStringEx("ACHIEVEMENT_GI_JOE_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_GI_JOE_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function checkMaxElves(param1:Level) : void
      {
         if(this.maxElves)
         {
            return;
         }
         this.maxElves = true;
         this.§_-Oc§(param1,"max_elves",Locale.loadStringEx("ACHIEVEMENT_MAX_ELVES_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_MAX_ELVES_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function hasImperialSaviour() : Boolean
      {
         return this.imperialSaviour;
      }
      
      public function doImperialSaviour(param1:Level) : void
      {
         this.imperialSaviour = true;
         this.§_-Oc§(param1,"imperial_saviour",Locale.loadStringEx("ACHIEVEMENT_IMPERIAL_SAVIOUR_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_IMPERIAL_SAVIOUR_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function checkArmaggedon(param1:Level) : void
      {
         if(this.armaggedon)
         {
            return;
         }
         this.armaggedon = true;
         this.§_-Oc§(param1,"armaggedon",Locale.loadStringEx("ACHIEVEMENT_ARMAGGEDON_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ARMAGGEDON_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-15§(param1:Level) : void
      {
         if(this.impatient)
         {
            return;
         }
         this.impatient = true;
         this.§_-Oc§(param1,"impatient",Locale.loadStringEx("ACHIEVEMENT_IMPATIENT_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_IMPATIENT_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function sellTower(param1:Level) : void
      {
         this.sellTowers++;
         if(!this.realEstate && this.sellTowers == 30)
         {
            this.realEstate = true;
            this.§_-Oc§(param1,"real_estate",Locale.loadStringEx("ACHIEVEMENT_REAL_STATE_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_REAL_STATE_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function §_-H4§(param1:Level) : void
      {
         if(this.indecisive)
         {
            return;
         }
         this.indecisive = true;
         this.§_-Oc§(param1,"indecisive",Locale.loadStringEx("ACHIEVEMENT_INDECISIVE_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_INDECISIVE_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-TI§(param1:Level) : void
      {
         this.soldiersKilled++;
         if(!this.cannonFodder && this.soldiersKilled == 1000)
         {
            this.cannonFodder = true;
            this.§_-Oc§(param1,"cannon_fodder",Locale.loadStringEx("ACHIEVEMENT_CANNON_FODDER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_CANNON_FODDER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function addRegeneration(param1:int, param2:Level) : void
      {
         this.soldiersRegeneration = this.soldiersRegeneration + param1;
         if(this.dieHard)
         {
            return;
         }
         if(this.soldiersRegeneration >= 50000)
         {
            this.§_-6j§(param2);
         }
      }
      
      public function §_-6j§(param1:Level) : void
      {
         if(this.dieHard)
         {
            return;
         }
         this.dieHard = true;
         this.§_-Oc§(param1,"die_hard",Locale.loadStringEx("ACHIEVEMENT_DIE_HARD_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DIE_HARD_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-NI§(param1:Level) : void
      {
         if(this.fearless)
         {
            return;
         }
         this.fearless = true;
         this.§_-Oc§(param1,"fearless",Locale.loadStringEx("ACHIEVEMENT_FEARLESS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_FEARLESS_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function buildTowerRanger(param1:Level) : void
      {
         this.buildRangers++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerMusketeer(param1:Level) : void
      {
         this.buildMusketeers++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerPaladin(param1:Level) : void
      {
         this.buildPaladins++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerBarbarian(param1:Level) : void
      {
         this.buildBarbarians++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerArcane(param1:Level) : void
      {
         this.buildArcanes++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerSorcerer(param1:Level) : void
      {
         this.buildSorcerers++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerBfg(param1:Level) : void
      {
         this.buildBfg++;
         this.checkSpecialization(param1);
      }
      
      public function buildTowerTesla(param1:Level) : void
      {
         this.buildTesla++;
         this.checkSpecialization(param1);
      }
      
      public function checkSpecialization(param1:Level) : void
      {
         if(this.specialization)
         {
            return;
         }
         if(this.buildRangers != 0 && this.buildMusketeers != 0 && this.buildPaladins != 0 && this.buildBarbarians != 0 && this.buildArcanes != 0 && this.buildSorcerers != 0 && this.buildBfg != 0 && this.buildTesla != 0)
         {
            this.specialization = true;
            this.§_-Oc§(param1,"the_specialist",Locale.loadStringEx("ACHIEVEMENT_SPECIALIZATION_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SPECIALIZATION_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function §_-MC§(param1:Level) : void
      {
         this.fireballKills++;
         if(this.deathFromAbove)
         {
            return;
         }
         if(this.fireballKills == 100)
         {
            this.deathFromAbove = true;
            this.§_-Oc§(param1,"death_from_above",Locale.loadStringEx("ACHIEVEMENT_DEATH_FROM_ABOVE_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEATH_FROM_ABOVE_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function changeRallyPoint(param1:Level) : void
      {
         this.rallyChanges++;
         if(this.tactician)
         {
            return;
         }
         if(this.rallyChanges == 200)
         {
            this.tactician = true;
            this.§_-Oc§(param1,"tactician",Locale.loadStringEx("ACHIEVEMENT_TACTICIAN_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_TACTICIAN_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function likeAHenderson(param1:Level) : void
      {
         if(this.henderson)
         {
            return;
         }
         this.henderson = true;
         this.§_-Oc§(param1,"like_a_henderson",Locale.loadStringEx("ACHIEVEMENT_HENDERSON_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_HENDERSON_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-2B§(param1:Level) : void
      {
         this.sunrayShots++;
         if(this.sunburner)
         {
            return;
         }
         if(this.sunrayShots == 20)
         {
            this.sunburner = true;
            this.§_-Oc§(param1,"sunburner",Locale.loadStringEx("ACHIEVEMENT_SUN_BURNER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SUN_BURNER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function §_-49§(param1:int) : void
      {
         if(!this.earn15Stars && param1 >= 15)
         {
            this.earn15Stars = true;
            this.saveData();
         }
         if(!this.earn30Stars && param1 >= 30)
         {
            this.earn30Stars = true;
            this.saveData();
         }
         if(!this.earn45Stars && param1 >= 45)
         {
            this.earn45Stars = true;
            this.saveData();
         }
      }
      
      public function axeFire(param1:Level) : void
      {
         this.axesFire++;
         if(this.axeRainer)
         {
            return;
         }
         if(this.axesFire == 500)
         {
            this.axeRainer = true;
            this.§_-Oc§(param1,"axe_rainer",Locale.loadStringEx("ACHIEVEMENT_AXE_RAINER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_AXE_RAINER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function sniperEnemy(param1:Level) : void
      {
         this.sniperKills++;
         if(this.sniper)
         {
            return;
         }
         if(this.sniperKills == 50)
         {
            this.sniper = true;
            this.§_-Oc§(param1,"sniper",Locale.loadStringEx("ACHIEVEMENT_SNIPER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SNIPER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function poisonEnemy(param1:Level) : void
      {
         this.poisonKills++;
         if(this.toxicity)
         {
            return;
         }
         if(this.poisonKills == 50)
         {
            this.toxicity = true;
            this.§_-Oc§(param1,"toxicity",Locale.loadStringEx("ACHIEVEMENT_TOXICITY_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_TOXICITY_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function desintegrateEnemy(param1:Level) : void
      {
         this.desintegrateKills++;
         if(this.dustToDust)
         {
            return;
         }
         if(this.desintegrateKills == 50)
         {
            this.dustToDust = true;
            this.§_-Oc§(param1,"dust_to_dust",Locale.loadStringEx("ACHIEVEMENT_DUST_TO_DUST_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DUST_TO_DUST_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function polymorphEnemy(param1:Level) : void
      {
         this.polymorphKills++;
         if(this.shepard)
         {
            return;
         }
         if(this.polymorphKills == 50)
         {
            this.shepard = true;
            this.§_-Oc§(param1,"shepard",Locale.loadStringEx("ACHIEVEMENT_SHEPARD_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SHEPARD_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function missileFire(param1:Level) : void
      {
         this.missilesFire++;
         if(this.rocketeer)
         {
            return;
         }
         if(this.missilesFire == 130)
         {
            this.rocketeer = true;
            this.§_-Oc§(param1,"rocketeer",Locale.loadStringEx("ACHIEVEMENT_ROCKETEER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ROCKETEER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function thornEnemy(param1:Level) : void
      {
         this.thornsEnemies++;
         if(this.entangled)
         {
            return;
         }
         if(this.thornsEnemies == 500)
         {
            this.entangled = true;
            this.§_-Oc§(param1,"entangled",Locale.loadStringEx("ACHIEVEMENT_ENTANGLED_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ENTANGLED_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function §_-Q4§(param1:Level) : void
      {
         if(this.energyNetwork)
         {
            return;
         }
         this.energyNetwork = true;
         this.§_-Oc§(param1,"energy_network",Locale.loadStringEx("ACHIEVEMENT_ENERGY_NETWORK_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ENERGY_NETWORK_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-D1§(param1:Level) : void
      {
         if(this.elementalist)
         {
            return;
         }
         this.elementalist = true;
         this.§_-Oc§(param1,"elementalist",Locale.loadStringEx("ACHIEVEMENT_ELEMENTALIST_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ELEMENTALIST_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function evalBarbarianRush(param1:Level) : void
      {
         if(this.barbarianRush)
         {
            return;
         }
         this.barbarianRush = true;
         this.§_-Oc§(param1,"barbarian_rush",Locale.loadStringEx("ACHIEVEMENT_BARBARIAN_RUSH_SHORT_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_BARBARIAN_RUSH_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function clusterFire(param1:Level) : void
      {
         this.clustersFire++;
         if(this.clusterRain)
         {
            return;
         }
         if(this.clustersFire == 500)
         {
            this.clusterRain = true;
            this.§_-Oc§(param1,"clustered",Locale.loadStringEx("ACHIEVEMENT_CLUSTERED_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_CLUSTERED_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function teslaKill(param1:Level) : void
      {
         this.acdcKills++;
         if(this.acdc)
         {
            return;
         }
         if(this.acdcKills == 300)
         {
            this.acdc = true;
            this.§_-Oc§(param1,"acdc",Locale.loadStringEx("ACHIEVEMENT_ACDC_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_ACDC_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function healMe(param1:int, param2:Level) : void
      {
         this.paladinHeals = this.paladinHeals + param1;
         if(this.medic)
         {
            return;
         }
         if(this.paladinHeals >= 7000)
         {
            this.medic = true;
            this.§_-Oc§(param2,"medic",Locale.loadStringEx("ACHIEVEMENT_MEDIC_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_MEDIC_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function holyStrike(param1:Level) : void
      {
         this.holyChorusCount++;
         if(this.holyChorus)
         {
            return;
         }
         if(this.holyChorusCount == 100)
         {
            this.holyChorus = true;
            this.§_-Oc§(param1,"holy_chorus",Locale.loadStringEx("ACHIEVEMENT_HOLY_CHORUS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_HOLY_CHORUS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function killSheep(param1:Level) : void
      {
         this.sheepsKilled++;
         if(this.sheepKiller)
         {
            return;
         }
         if(this.sheepsKilled >= 10)
         {
            this.sheepKiller = true;
            this.§_-Oc§(param1,"sheep_killer",Locale.loadStringEx("ACHIEVEMENT_SHEEP_KILLER_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_SHEEP_KILLER_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function catchAFish(param1:Level) : void
      {
         if(this.fisherman)
         {
            return;
         }
         this.fisherman = true;
         this.§_-Oc§(param1,"catch_a_fish",Locale.loadStringEx("ACHIEVEMENT_CATCH_A_FISH_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_CATCH_A_FISH_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      public function §_-19§(param1:Level) : void
      {
         if(this.greatDefender)
         {
            return;
         }
         this.greatDefender = true;
         this.saveData();
      }
      
      public function §_-Iu§(param1:Level) : void
      {
         if(this.greatDefenderHeroic)
         {
            return;
         }
         this.greatDefenderHeroic = true;
         this.saveData();
      }
      
      public function chkGreatDefenderIron(param1:Level) : void
      {
         if(this.greatDefenderIron)
         {
            return;
         }
         this.greatDefenderIron = true;
         this.saveData();
      }
      
      public function defeatSarelgaz(param1:Level) : void
      {
         if(!this.killSarelgaz)
         {
            this.killSarelgaz = true;
            this.§_-Oc§(param1,"defeat_sarelgaz",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_SARELGAZ_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_SARELGAZ_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function defeatGulthak(param1:Level) : void
      {
         if(!this.killGulThak)
         {
            this.killGulThak = true;
            this.§_-Oc§(param1,"defeat_gulthak",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GULTHAK_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GULTHAK_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function helpFredo(param1:Level) : void
      {
         if(!this.freeFredo)
         {
            this.freeFredo = true;
            this.§_-Oc§(param1,"free_fredo",Locale.loadStringEx("ACHIEVEMENT_FREE_FREDO_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_FREE_FREDO_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function defeatGreenMuk(param1:Level) : void
      {
         if(!this.killGreenmuk)
         {
            this.killGreenmuk = true;
            this.§_-Oc§(param1,"defeat_greenmuck",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GREENMUK_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GREENMUK_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function heroReachMedium(param1:Level) : void
      {
         if(!this.heroMedium)
         {
            this.heroMedium = true;
            this.§_-Oc§(param1,"hero_medium",Locale.loadStringEx("ACHIEVEMENT_HERO_MEDIUM_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_HERO_MEDIUM_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function heroReachHard(param1:Level) : void
      {
         if(!this.heroHard)
         {
            this.heroHard = true;
            this.§_-Oc§(param1,"hero_hard",Locale.loadStringEx("ACHIEVEMENT_HERO_HARD_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_HERO_HARD_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function defeatBanditLord(param1:Level) : void
      {
         if(!this.killBanditLord)
         {
            this.killBanditLord = true;
            this.§_-Oc§(param1,"defeat_bandit",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_BANDIT_BOSS_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_BANDIT_BOSS_DESCRIPTION",Locale.getDefaultLang()));
         }
      }
      
      public function saveData() : void
      {
         var my_so:SharedObject = null;
         if(!this.game.§_-Pd§)
         {
            try
            {
               my_so = SharedObject.getLocal(this.game.selectedSlot);
               my_so.data.achievements.mageBeamMeUp = this.mageBeamMeUp;
               my_so.data.achievements.mageBeamMeUpEnemies = this.mageBeamMeUpEnemies;
               my_so.data.achievements.towerBuilded = this.towerBuilded;
               my_so.data.achievements.notificationEnemy = this.notificationEnemy;
               my_so.data.achievements.magesTowerUpgradeLevel3 = this.magesTowerUpgradeLevel3;
               my_so.data.achievements.archersTowerUpgradeLevel3 = this.archersTowerUpgradeLevel3;
               my_so.data.achievements.soldiersTowerUpgradeLevel3 = this.soldiersTowerUpgradeLevel3;
               my_so.data.achievements.engineersTowerUpgradeLevel3 = this.engineersTowerUpgradeLevel3;
               my_so.data.achievements.killedEnemies = this.killedEnemies;
               my_so.data.achievements.fireballKills = this.fireballKills;
               my_so.data.achievements.buildRangers = this.buildRangers;
               my_so.data.achievements.buildMusketeers = this.buildMusketeers;
               my_so.data.achievements.buildPaladins = this.buildPaladins;
               my_so.data.achievements.buildBarbarians = this.buildBarbarians;
               my_so.data.achievements.buildArcanes = this.buildArcanes;
               my_so.data.achievements.buildSorcerers = this.buildSorcerers;
               my_so.data.achievements.buildBfg = this.buildBfg;
               my_so.data.achievements.buildTesla = this.buildTesla;
               my_so.data.achievements.rallyChanges = this.rallyChanges;
               my_so.data.achievements.soldiersRegeneration = this.soldiersRegeneration;
               my_so.data.achievements.soldiersTrained = this.soldiersTrained;
               my_so.data.achievements.soldiersKilled = this.soldiersKilled;
               my_so.data.achievements.sellTowers = this.sellTowers;
               my_so.data.achievements.sunrayShots = this.sunrayShots;
               my_so.data.achievements.earlyWavesCalled = this.earlyWavesCalled;
               my_so.data.achievements.specialization = this.specialization;
               my_so.data.achievements.desintegrateKills = this.desintegrateKills;
               my_so.data.achievements.polymorphKills = this.polymorphKills;
               my_so.data.achievements.missilesFire = this.missilesFire;
               my_so.data.achievements.poisonKills = this.poisonKills;
               my_so.data.achievements.sniperKills = this.sniperKills;
               my_so.data.achievements.axesFire = this.axesFire;
               my_so.data.achievements.thornsEnemies = this.thornsEnemies;
               my_so.data.achievements.clustersFire = this.clustersFire;
               my_so.data.achievements.acdcKills = this.acdcKills;
               my_so.data.achievements.paladinHeals = this.paladinHeals;
               my_so.data.achievements.holyChorusCount = this.holyChorusCount;
               my_so.data.achievements.sheepsKilled = this.sheepsKilled;
               my_so.data.achievements.firstBlood = this.firstBlood;
               my_so.data.achievements.daring = this.daring;
               my_so.data.achievements.easyTowerBuilder = this.easyTowerBuilder;
               my_so.data.achievements.bloodlust = this.bloodlust;
               my_so.data.achievements.armaggedon = this.armaggedon;
               my_so.data.achievements.towerUpgradeLevel3 = this.towerUpgradeLevel3;
               my_so.data.achievements.earn15Stars = this.earn15Stars;
               my_so.data.achievements.whatsThat = this.whatsThat;
               my_so.data.achievements.earn30Stars = this.earn30Stars;
               my_so.data.achievements.killJuggernaut = this.killJuggernaut;
               my_so.data.achievements.mediumTowerBuilder = this.mediumTowerBuilder;
               my_so.data.achievements.killMountainBoss = this.killMountainBoss;
               my_so.data.achievements.slayer = this.slayer;
               my_so.data.achievements.deathFromAbove = this.deathFromAbove;
               my_so.data.achievements.tactician = this.tactician;
               my_so.data.achievements.earn45Stars = this.earn45Stars;
               my_so.data.achievements.hardTowerBuilder = this.hardTowerBuilder;
               my_so.data.achievements.killEndBoss = this.killEndBoss;
               my_so.data.achievements.multiKill = this.multiKill;
               my_so.data.achievements.dieHard = this.dieHard;
               my_so.data.achievements.giJoe = this.giJoe;
               my_so.data.achievements.cannonFodder = this.cannonFodder;
               my_so.data.achievements.fearless = this.fearless;
               my_so.data.achievements.realEstate = this.realEstate;
               my_so.data.achievements.indecisive = this.indecisive;
               my_so.data.achievements.impatient = this.impatient;
               my_so.data.achievements.maxElves = this.maxElves;
               my_so.data.achievements.henderson = this.henderson;
               my_so.data.achievements.sunburner = this.sunburner;
               my_so.data.achievements.imperialSaviour = this.imperialSaviour;
               my_so.data.achievements.dustToDust = this.dustToDust;
               my_so.data.achievements.shepard = this.shepard;
               my_so.data.achievements.rocketeer = this.rocketeer;
               my_so.data.achievements.toxicity = this.toxicity;
               my_so.data.achievements.sniper = this.sniper;
               my_so.data.achievements.axeRainer = this.axeRainer;
               my_so.data.achievements.energyNetwork = this.energyNetwork;
               my_so.data.achievements.elementalist = this.elementalist;
               my_so.data.achievements.entangled = this.entangled;
               my_so.data.achievements.barbarianRush = this.barbarianRush;
               my_so.data.achievements.clusterRain = this.clusterRain;
               my_so.data.achievements.acdc = this.acdc;
               my_so.data.achievements.medic = this.medic;
               my_so.data.achievements.holyChorus = this.holyChorus;
               my_so.data.achievements.fisherman = this.fisherman;
               my_so.data.achievements.sheepKiller = this.sheepKiller;
               my_so.data.achievements.greatDefender = this.greatDefender;
               my_so.data.achievements.greatDefenderHeroic = this.greatDefenderHeroic;
               my_so.data.achievements.greatDefenderIron = this.greatDefenderIron;
               my_so.data.achievements.killSarelgaz = this.killSarelgaz;
               my_so.data.achievements.freeFredo = this.freeFredo;
               my_so.data.achievements.killGulThak = this.killGulThak;
               my_so.data.achievements.killGreenmuk = this.killGreenmuk;
               my_so.data.achievements.heroMedium = this.heroMedium;
               my_so.data.achievements.heroHard = this.heroHard;
               my_so.data.achievements.killBanditLord = this.killBanditLord;
               my_so.flush();
               my_so.close();
               my_so = null;
               return;
            }
            catch(err:Error)
            {
               return;
            }
         }
      }
      
      public function loadData() : void
      {
         var my_so:SharedObject = null;
         try
         {
            my_so = SharedObject.getLocal(this.game.selectedSlot);
            this.mageBeamMeUp = my_so.data.achievements.mageBeamMeUp;
            this.mageBeamMeUpEnemies = my_so.data.achievements.mageBeamMeUpEnemies;
            this.towerBuilded = my_so.data.achievements.towerBuilded;
            this.notificationEnemy = my_so.data.achievements.notificationEnemy;
            this.magesTowerUpgradeLevel3 = my_so.data.achievements.magesTowerUpgradeLevel3;
            this.archersTowerUpgradeLevel3 = my_so.data.achievements.archersTowerUpgradeLevel3;
            this.soldiersTowerUpgradeLevel3 = my_so.data.achievements.soldiersTowerUpgradeLevel3;
            this.engineersTowerUpgradeLevel3 = my_so.data.achievements.engineersTowerUpgradeLevel3;
            this.killedEnemies = my_so.data.achievements.killedEnemies;
            this.fireballKills = my_so.data.achievements.fireballKills;
            this.buildRangers = my_so.data.achievements.buildRangers;
            this.buildMusketeers = my_so.data.achievements.buildMusketeers;
            this.buildPaladins = my_so.data.achievements.buildPaladins;
            this.buildBarbarians = my_so.data.achievements.buildBarbarians;
            this.buildArcanes = my_so.data.achievements.buildArcanes;
            this.buildSorcerers = my_so.data.achievements.buildSorcerers;
            this.buildBfg = my_so.data.achievements.buildBfg;
            this.buildTesla = my_so.data.achievements.buildTesla;
            this.rallyChanges = my_so.data.achievements.rallyChanges;
            this.soldiersRegeneration = my_so.data.achievements.soldiersRegeneration;
            this.soldiersTrained = my_so.data.achievements.soldiersTrained;
            this.soldiersKilled = my_so.data.achievements.soldiersKilled;
            this.sellTowers = my_so.data.achievements.sellTowers;
            this.sunrayShots = my_so.data.achievements.sunrayShots;
            this.earlyWavesCalled = my_so.data.achievements.earlyWavesCalled;
            this.specialization = my_so.data.achievements.specialization;
            this.desintegrateKills = my_so.data.achievements.desintegrateKills;
            this.polymorphKills = my_so.data.achievements.polymorphKills;
            this.missilesFire = my_so.data.achievements.missilesFire;
            this.poisonKills = my_so.data.achievements.poisonKills;
            this.sniperKills = my_so.data.achievements.sniperKills;
            this.axesFire = my_so.data.achievements.axesFire;
            this.thornsEnemies = my_so.data.achievements.thornsEnemies;
            this.clustersFire = my_so.data.achievements.clustersFire;
            this.acdcKills = my_so.data.achievements.acdcKills;
            this.paladinHeals = my_so.data.achievements.paladinHeals;
            this.holyChorusCount = my_so.data.achievements.holyChorusCount;
            this.sheepsKilled = my_so.data.achievements.sheepsKilled;
            this.firstBlood = my_so.data.achievements.firstBlood;
            this.daring = my_so.data.achievements.daring;
            this.easyTowerBuilder = my_so.data.achievements.easyTowerBuilder;
            this.bloodlust = my_so.data.achievements.bloodlust;
            this.armaggedon = my_so.data.achievements.armaggedon;
            this.towerUpgradeLevel3 = my_so.data.achievements.towerUpgradeLevel3;
            this.earn15Stars = my_so.data.achievements.earn15Stars;
            this.whatsThat = my_so.data.achievements.whatsThat;
            this.earn30Stars = my_so.data.achievements.earn30Stars;
            this.killJuggernaut = my_so.data.achievements.killJuggernaut;
            this.mediumTowerBuilder = my_so.data.achievements.mediumTowerBuilder;
            this.killMountainBoss = my_so.data.achievements.killMountainBoss;
            this.slayer = my_so.data.achievements.slayer;
            this.deathFromAbove = my_so.data.achievements.deathFromAbove;
            this.tactician = my_so.data.achievements.tactician;
            this.earn45Stars = my_so.data.achievements.earn45Stars;
            this.hardTowerBuilder = my_so.data.achievements.hardTowerBuilder;
            this.killEndBoss = my_so.data.achievements.killEndBoss;
            this.multiKill = my_so.data.achievements.multiKill;
            this.dieHard = my_so.data.achievements.dieHard;
            this.giJoe = my_so.data.achievements.giJoe;
            this.cannonFodder = my_so.data.achievements.cannonFodder;
            this.fearless = my_so.data.achievements.fearless;
            this.realEstate = my_so.data.achievements.realEstate;
            this.indecisive = my_so.data.achievements.indecisive;
            this.impatient = my_so.data.achievements.impatient;
            this.maxElves = my_so.data.achievements.maxElves;
            this.henderson = my_so.data.achievements.henderson;
            this.sunburner = my_so.data.achievements.sunburner;
            this.imperialSaviour = my_so.data.achievements.imperialSaviour;
            this.dustToDust = my_so.data.achievements.dustToDust;
            this.shepard = my_so.data.achievements.shepard;
            this.rocketeer = my_so.data.achievements.rocketeer;
            this.toxicity = my_so.data.achievements.toxicity;
            this.sniper = my_so.data.achievements.sniper;
            this.axeRainer = my_so.data.achievements.axeRainer;
            this.energyNetwork = my_so.data.achievements.energyNetwork;
            this.elementalist = my_so.data.achievements.elementalist;
            this.entangled = my_so.data.achievements.entangled;
            this.barbarianRush = my_so.data.achievements.barbarianRush;
            this.clusterRain = my_so.data.achievements.clusterRain;
            this.acdc = my_so.data.achievements.acdc;
            this.medic = my_so.data.achievements.medic;
            this.holyChorus = my_so.data.achievements.holyChorus;
            this.fisherman = my_so.data.achievements.fisherman;
            this.sheepKiller = my_so.data.achievements.sheepKiller;
            this.greatDefender = my_so.data.achievements.greatDefender;
            this.greatDefenderHeroic = my_so.data.achievements.greatDefenderHeroic;
            this.greatDefenderIron = my_so.data.achievements.greatDefenderIron;
            this.killSarelgaz = my_so.data.achievements.killSarelgaz;
            this.freeFredo = my_so.data.achievements.freeFredo;
            this.killGulThak = my_so.data.achievements.killGulThak;
            this.killGreenmuk = my_so.data.achievements.killGreenmuk;
            this.heroMedium = my_so.data.achievements.heroMedium;
            this.heroHard = my_so.data.achievements.heroHard;
            this.killBanditLord = my_so.data.achievements.killBanditLord;
            my_so.flush();
            my_so.close();
            my_so = null;
            return;
         }
         catch(err:Error)
         {
            return;
         }
      }
      
      public function loadFromObject(param1:Object) : void
      {
         this.mageBeamMeUp = param1.mageBeamMeUp;
         this.mageBeamMeUpEnemies = param1.mageBeamMeUpEnemies;
         this.towerBuilded = param1.towerBuilded;
         this.notificationEnemy = param1.notificationEnemy;
         this.magesTowerUpgradeLevel3 = param1.magesTowerUpgradeLevel3;
         this.archersTowerUpgradeLevel3 = param1.archersTowerUpgradeLevel3;
         this.soldiersTowerUpgradeLevel3 = param1.soldiersTowerUpgradeLevel3;
         this.engineersTowerUpgradeLevel3 = param1.engineersTowerUpgradeLevel3;
         this.killedEnemies = param1.killedEnemies;
         this.fireballKills = param1.fireballKills;
         this.buildRangers = param1.buildRangers;
         this.buildMusketeers = param1.buildMusketeers;
         this.buildPaladins = param1.buildPaladins;
         this.buildBarbarians = param1.buildBarbarians;
         this.buildArcanes = param1.buildArcanes;
         this.buildSorcerers = param1.buildSorcerers;
         this.buildBfg = param1.buildBfg;
         this.buildTesla = param1.buildTesla;
         this.rallyChanges = param1.rallyChanges;
         this.soldiersRegeneration = param1.soldiersRegeneration;
         this.soldiersTrained = param1.soldiersTrained;
         this.soldiersKilled = param1.soldiersKilled;
         this.sellTowers = param1.sellTowers;
         this.sunrayShots = param1.sunrayShots;
         this.earlyWavesCalled = param1.earlyWavesCalled;
         this.specialization = param1.specialization;
         this.desintegrateKills = param1.desintegrateKills;
         this.polymorphKills = param1.polymorphKills;
         this.missilesFire = param1.missilesFire;
         this.poisonKills = param1.poisonKills;
         this.sniperKills = param1.sniperKills;
         this.axesFire = param1.axesFire;
         this.thornsEnemies = param1.thornsEnemies;
         this.clustersFire = param1.clustersFire;
         this.acdcKills = param1.acdcKills;
         this.paladinHeals = param1.paladinHeals;
         this.holyChorusCount = param1.holyChorusCount;
         this.sheepsKilled = param1.sheepsKilled;
         this.firstBlood = param1.firstBlood;
         this.daring = param1.daring;
         this.easyTowerBuilder = param1.easyTowerBuilder;
         this.bloodlust = param1.bloodlust;
         this.armaggedon = param1.armaggedon;
         this.towerUpgradeLevel3 = param1.towerUpgradeLevel3;
         this.earn15Stars = param1.earn15Stars;
         this.whatsThat = param1.whatsThat;
         this.earn30Stars = param1.earn30Stars;
         this.killJuggernaut = param1.killJuggernaut;
         this.mediumTowerBuilder = param1.mediumTowerBuilder;
         this.killMountainBoss = param1.killMountainBoss;
         this.slayer = param1.slayer;
         this.deathFromAbove = param1.deathFromAbove;
         this.tactician = param1.tactician;
         this.earn45Stars = param1.earn45Stars;
         this.hardTowerBuilder = param1.hardTowerBuilder;
         this.killEndBoss = param1.killEndBoss;
         this.multiKill = param1.multiKill;
         this.dieHard = param1.dieHard;
         this.giJoe = param1.giJoe;
         this.cannonFodder = param1.cannonFodder;
         this.fearless = param1.fearless;
         this.realEstate = param1.realEstate;
         this.indecisive = param1.indecisive;
         this.impatient = param1.impatient;
         this.maxElves = param1.maxElves;
         this.henderson = param1.henderson;
         this.sunburner = param1.sunburner;
         this.imperialSaviour = param1.imperialSaviour;
         this.dustToDust = param1.dustToDust;
         this.shepard = param1.shepard;
         this.rocketeer = param1.rocketeer;
         this.toxicity = param1.toxicity;
         this.sniper = param1.sniper;
         this.axeRainer = param1.axeRainer;
         this.energyNetwork = param1.energyNetwork;
         this.elementalist = param1.elementalist;
         this.entangled = param1.entangled;
         this.barbarianRush = param1.barbarianRush;
         this.clusterRain = param1.clusterRain;
         this.acdc = param1.acdc;
         this.medic = param1.medic;
         this.holyChorus = param1.holyChorus;
         this.fisherman = param1.fisherman;
         this.sheepKiller = param1.sheepKiller;
         this.greatDefender = param1.greatDefender;
         this.greatDefenderHeroic = param1.greatDefenderHeroic;
         this.greatDefenderIron = param1.greatDefenderIron;
         this.killSarelgaz = param1.killSarelgaz;
         this.freeFredo = param1.freeFredo;
         this.killGulThak = param1.killGulThak;
         this.killGreenmuk = param1.killGreenmuk;
         this.heroMedium = param1.heroMedium;
         this.heroHard = param1.heroHard;
         this.killBanditLord = param1.killBanditLord;
      }
      
      public function getAchievementObject() : Object
      {
         var _loc1_:Object = new Object();
         _loc1_.mageBeamMeUp = this.mageBeamMeUp;
         _loc1_.mageBeamMeUpEnemies = this.mageBeamMeUpEnemies;
         _loc1_.towerBuilded = this.towerBuilded;
         _loc1_.notificationEnemy = this.notificationEnemy;
         _loc1_.magesTowerUpgradeLevel3 = this.magesTowerUpgradeLevel3;
         _loc1_.archersTowerUpgradeLevel3 = this.archersTowerUpgradeLevel3;
         _loc1_.soldiersTowerUpgradeLevel3 = this.soldiersTowerUpgradeLevel3;
         _loc1_.engineersTowerUpgradeLevel3 = this.engineersTowerUpgradeLevel3;
         _loc1_.killedEnemies = this.killedEnemies;
         _loc1_.fireballKills = this.fireballKills;
         _loc1_.buildRangers = this.buildRangers;
         _loc1_.buildMusketeers = this.buildMusketeers;
         _loc1_.buildPaladins = this.buildPaladins;
         _loc1_.buildBarbarians = this.buildBarbarians;
         _loc1_.buildArcanes = this.buildArcanes;
         _loc1_.buildSorcerers = this.buildSorcerers;
         _loc1_.buildBfg = this.buildBfg;
         _loc1_.buildTesla = this.buildTesla;
         _loc1_.rallyChanges = this.rallyChanges;
         _loc1_.soldiersRegeneration = this.soldiersRegeneration;
         _loc1_.soldiersTrained = this.soldiersTrained;
         _loc1_.soldiersKilled = this.soldiersKilled;
         _loc1_.sellTowers = this.sellTowers;
         _loc1_.sunrayShots = this.sunrayShots;
         _loc1_.earlyWavesCalled = this.earlyWavesCalled;
         _loc1_.specialization = this.specialization;
         _loc1_.desintegrateKills = this.desintegrateKills;
         _loc1_.polymorphKills = this.polymorphKills;
         _loc1_.missilesFire = this.missilesFire;
         _loc1_.poisonKills = this.poisonKills;
         _loc1_.sniperKills = this.sniperKills;
         _loc1_.axesFire = this.axesFire;
         _loc1_.thornsEnemies = this.thornsEnemies;
         _loc1_.clustersFire = this.clustersFire;
         _loc1_.acdcKills = this.acdcKills;
         _loc1_.paladinHeals = this.paladinHeals;
         _loc1_.holyChorusCount = this.holyChorusCount;
         _loc1_.sheepsKilled = this.sheepsKilled;
         _loc1_.firstBlood = this.firstBlood;
         _loc1_.daring = this.daring;
         _loc1_.easyTowerBuilder = this.easyTowerBuilder;
         _loc1_.bloodlust = this.bloodlust;
         _loc1_.armaggedon = this.armaggedon;
         _loc1_.towerUpgradeLevel3 = this.towerUpgradeLevel3;
         _loc1_.earn15Stars = this.earn15Stars;
         _loc1_.whatsThat = this.whatsThat;
         _loc1_.earn30Stars = this.earn30Stars;
         _loc1_.killJuggernaut = this.killJuggernaut;
         _loc1_.mediumTowerBuilder = this.mediumTowerBuilder;
         _loc1_.killMountainBoss = this.killMountainBoss;
         _loc1_.slayer = this.slayer;
         _loc1_.deathFromAbove = this.deathFromAbove;
         _loc1_.tactician = this.tactician;
         _loc1_.earn45Stars = this.earn45Stars;
         _loc1_.hardTowerBuilder = this.hardTowerBuilder;
         _loc1_.killEndBoss = this.killEndBoss;
         _loc1_.multiKill = this.multiKill;
         _loc1_.dieHard = this.dieHard;
         _loc1_.giJoe = this.giJoe;
         _loc1_.cannonFodder = this.cannonFodder;
         _loc1_.fearless = this.fearless;
         _loc1_.realEstate = this.realEstate;
         _loc1_.indecisive = this.indecisive;
         _loc1_.impatient = this.impatient;
         _loc1_.maxElves = this.maxElves;
         _loc1_.henderson = this.henderson;
         _loc1_.sunburner = this.sunburner;
         _loc1_.imperialSaviour = this.imperialSaviour;
         _loc1_.dustToDust = this.dustToDust;
         _loc1_.shepard = this.shepard;
         _loc1_.rocketeer = this.rocketeer;
         _loc1_.toxicity = this.toxicity;
         _loc1_.sniper = this.sniper;
         _loc1_.axeRainer = this.axeRainer;
         _loc1_.energyNetwork = this.energyNetwork;
         _loc1_.elementalist = this.elementalist;
         _loc1_.entangled = this.entangled;
         _loc1_.barbarianRush = this.barbarianRush;
         _loc1_.clusterRain = this.clusterRain;
         _loc1_.acdc = this.acdc;
         _loc1_.medic = this.medic;
         _loc1_.holyChorus = this.holyChorus;
         _loc1_.fisherman = this.fisherman;
         _loc1_.sheepKiller = this.sheepKiller;
         _loc1_.greatDefender = this.greatDefender;
         _loc1_.greatDefenderHeroic = this.greatDefenderHeroic;
         _loc1_.greatDefenderIron = this.greatDefenderIron;
         _loc1_.killSarelgaz = this.killSarelgaz;
         _loc1_.freeFredo = this.freeFredo;
         _loc1_.killGulThak = this.killGulThak;
         _loc1_.killGreenmuk = this.killGreenmuk;
         _loc1_.heroMedium = this.heroMedium;
         _loc1_.heroHard = this.heroHard;
         _loc1_.killBanditLord = this.killBanditLord;
         return _loc1_;
      }
      
      public function destroyThis() : void
      {
         this.game = null;
      }
   }
}
