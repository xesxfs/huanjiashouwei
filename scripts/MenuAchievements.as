package
{
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   
   public class MenuAchievements extends MovieClip
   {
       
      
      public var butClose:MovieClip;
      
      public var §_-H5§:Sprite;
      
      public var pages:Sprite;
      
      protected var yPos:int;
      
      protected var §_-KB§;
      
      protected var §_-At§:int;
      
      protected var §_-H9§:int = -275;
      
      protected var §_-CQ§:int = 1;
      
      protected var §_-Du§:int = 1;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      protected var game:Game;
      
      public function MenuAchievements(param1:Game)
      {
         this.§_-H5§ = new Sprite();
         this.pages = new Sprite();
         super();
         this.game = param1;
         this.x = 350;
         this.addChild(this.§_-H5§);
         this.addChild(this.pages);
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,-550,5,0.5,true);
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-A-§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
         this.loadItems();
      }
      
      protected function loadItem(param1:Boolean, param2:String, param3:String, param4:String) : void
      {
         var _loc5_:Point = null;
         if(this.§_-At§ % 2 == 0)
         {
            _loc5_ = new Point(this.§_-CQ§,this.yPos);
            this.yPos = this.yPos + this.§_-KB§;
         }
         else
         {
            _loc5_ = new Point(this.§_-H9§,this.yPos);
         }
         this.§_-H5§.addChild(new §_-BH§(_loc5_,param1,param2,param3,param4));
         this.§_-At§++;
      }
      
      public function changePage(param1:int) : void
      {
         this.§_-Du§ = param1;
         this.loadItems();
      }
      
      protected function loadItems() : void
      {
         this.emptyItems();
         this.createPages();
         var _loc1_:String = Locale.getDefaultLang();
         this.yPos = 95;
         this.§_-KB§ = 59;
         this.§_-At§ = 1;
         switch(this.§_-Du§)
         {
            case 1:
               this.loadItem(this.game.gameAchievement.firstBlood,"first_blood",Locale.loadStringEx("ACHIEVEMENT_FIRST_BLOOD_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_FIRST_BLOOD_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.daring,"daring",Locale.loadStringEx("ACHIEVEMENT_DARING_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DARING_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.easyTowerBuilder,"constructor",Locale.loadStringEx("ACHIEVEMENT_EASY_TOWER_BUILDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_EASY_TOWER_BUILDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.bloodlust,"bloodlust",Locale.loadStringEx("ACHIEVEMENT_BLOODLUST_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_BLOODLUST_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.armaggedon,"armaggedon",Locale.loadStringEx("ACHIEVEMENT_ARMAGGEDON_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ARMAGGEDON_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.towerUpgradeLevel3,"home_improvement",Locale.loadStringEx("ACHIEVEMENT_UPGRADE_LEVEL3_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_UPGRADE_LEVEL3_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.earn15Stars,"starry",Locale.loadStringEx("ACHIEVEMENT_EARN15_STARS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_EARN15_STARS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.whatsThat,"whats_that",Locale.loadStringEx("ACHIEVEMENT_WHATS_THAT_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_WHATS_THAT_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.earn30Stars,"super_mario",Locale.loadStringEx("ACHIEVEMENT_EARN30_STARS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_EARN30_STARS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.killJuggernaut,"nuts_and_bolts",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_JUGGERNAUT_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_JUGGERNAUT_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.mediumTowerBuilder,"engineer",Locale.loadStringEx("ACHIEVEMENT_MEDIUM_TOWER_BUILDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_MEDIUM_TOWER_BUILDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.killMountainBoss,"kill_him_yeti",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_MOUNTAIN_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_MOUNTAIN_BOSS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.slayer,"slayer",Locale.loadStringEx("ACHIEVEMENT_SLAYER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SLAYER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.deathFromAbove,"death_from_above",Locale.loadStringEx("ACHIEVEMENT_DEATH_FROM_ABOVE_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEATH_FROM_ABOVE_DESCRIPTION",_loc1_));
               break;
            case 2:
               this.loadItem(this.game.gameAchievement.tactician,"tactician",Locale.loadStringEx("ACHIEVEMENT_TACTICIAN_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_TACTICIAN_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.earn45Stars,"superstar",Locale.loadStringEx("ACHIEVEMENT_EARN45_STARS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_EARN45_STARS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.hardTowerBuilder,"the_architect",Locale.loadStringEx("ACHIEVEMENT_HARD_TOWER_BUILDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HARD_TOWER_BUILDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.killEndBoss,"defeat_end_boss",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_END_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_END_BOSS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.multiKill,"terminator",Locale.loadStringEx("ACHIEVEMENT_MULTIKILL_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_MULTIKILL_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.dieHard,"die_hard",Locale.loadStringEx("ACHIEVEMENT_DIE_HARD_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DIE_HARD_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.giJoe,"gi_joe",Locale.loadStringEx("ACHIEVEMENT_GI_JOE_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_GI_JOE_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.cannonFodder,"cannon_fodder",Locale.loadStringEx("ACHIEVEMENT_CANNON_FODDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_CANNON_FODDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.fearless,"fearless",Locale.loadStringEx("ACHIEVEMENT_FEARLESS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_FEARLESS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.realEstate,"real_estate",Locale.loadStringEx("ACHIEVEMENT_REAL_STATE_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_REAL_STATE_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.indecisive,"indecisive",Locale.loadStringEx("ACHIEVEMENT_INDECISIVE_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_INDECISIVE_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.impatient,"impatient",Locale.loadStringEx("ACHIEVEMENT_IMPATIENT_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_IMPATIENT_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.maxElves,"max_elves",Locale.loadStringEx("ACHIEVEMENT_MAX_ELVES_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_MAX_ELVES_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.henderson,"like_a_henderson",Locale.loadStringEx("ACHIEVEMENT_HENDERSON_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HENDERSON_DESCRIPTION",_loc1_));
               break;
            case 3:
               this.loadItem(this.game.gameAchievement.sunburner,"sunburner",Locale.loadStringEx("ACHIEVEMENT_SUN_BURNER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SUN_BURNER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.imperialSaviour,"imperial_saviour",Locale.loadStringEx("ACHIEVEMENT_IMPERIAL_SAVIOUR_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_IMPERIAL_SAVIOUR_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.specialization,"the_specialist",Locale.loadStringEx("ACHIEVEMENT_SPECIALIZATION_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SPECIALIZATION_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.sniper,"sniper",Locale.loadStringEx("ACHIEVEMENT_SNIPER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SNIPER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.toxicity,"toxicity",Locale.loadStringEx("ACHIEVEMENT_TOXICITY_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_TOXICITY_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.entangled,"entangled",Locale.loadStringEx("ACHIEVEMENT_ENTANGLED_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ENTANGLED_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.dustToDust,"dust_to_dust",Locale.loadStringEx("ACHIEVEMENT_DUST_TO_DUST_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DUST_TO_DUST_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.mageBeamMeUp,"beam_me_up",Locale.loadStringEx("ACHIEVEMENT_BEAM_ME_UP_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_BEAM_ME_UP_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.shepard,"shepard",Locale.loadStringEx("ACHIEVEMENT_SHEPARD_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SHEPARD_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.elementalist,"elementalist",Locale.loadStringEx("ACHIEVEMENT_ELEMENTALIST_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ELEMENTALIST_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.axeRainer,"axe_rainer",Locale.loadStringEx("ACHIEVEMENT_AXE_RAINER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_AXE_RAINER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.barbarianRush,"barbarian_rush",Locale.loadStringEx("ACHIEVEMENT_BARBARIAN_RUSH_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_BARBARIAN_RUSH_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.medic,"medic",Locale.loadStringEx("ACHIEVEMENT_MEDIC_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_MEDIC_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.holyChorus,"holy_chorus",Locale.loadStringEx("ACHIEVEMENT_HOLY_CHORUS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HOLY_CHORUS_DESCRIPTION",_loc1_));
               break;
            case 4:
               this.loadItem(this.game.gameAchievement.rocketeer,"rocketeer",Locale.loadStringEx("ACHIEVEMENT_ROCKETEER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ROCKETEER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.clusterRain,"clustered",Locale.loadStringEx("ACHIEVEMENT_CLUSTERED_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_CLUSTERED_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.energyNetwork,"energy_network",Locale.loadStringEx("ACHIEVEMENT_ENERGY_NETWORK_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ENERGY_NETWORK_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.acdc,"acdc",Locale.loadStringEx("ACHIEVEMENT_ACDC_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_ACDC_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.sheepKiller,"sheep_killer",Locale.loadStringEx("ACHIEVEMENT_SHEEP_KILLER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_SHEEP_KILLER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.fisherman,"catch_a_fish",Locale.loadStringEx("ACHIEVEMENT_CATCH_A_FISH_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_CATCH_A_FISH_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.greatDefender,"great_defender",Locale.loadStringEx("ACHIEVEMENT_GREAT_DEFENDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_GREAT_DEFENDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.greatDefenderHeroic,"heroic_defender",Locale.loadStringEx("ACHIEVEMENT_HEROIC_DEFENDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HEROIC_DEFENDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.greatDefenderIron,"iron_defender",Locale.loadStringEx("ACHIEVEMENT_IRON_DEFENDER_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_IRON_DEFENDER_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.heroMedium,"hero_medium",Locale.loadStringEx("ACHIEVEMENT_HERO_MEDIUM_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HERO_MEDIUM_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.heroHard,"hero_hard",Locale.loadStringEx("ACHIEVEMENT_HERO_HARD_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_HERO_HARD_DESCRIPTION",_loc1_));
               if(this.game.pc)
               {
                  this.loadItem(this.game.gameAchievement.freeFredo,"free_fredo",Locale.loadStringEx("ACHIEVEMENT_FREE_FREDO_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_FREE_FREDO_DESCRIPTION",_loc1_));
                  this.loadItem(this.game.gameAchievement.killSarelgaz,"defeat_sarelgaz",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_SARELGAZ_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_SARELGAZ_BOSS_DESCRIPTION",_loc1_));
                  this.loadItem(this.game.gameAchievement.killGulThak,"defeat_gulthak",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GULTHAK_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GULTHAK_BOSS_DESCRIPTION",_loc1_));
                  break;
               }
               break;
            case 5:
               this.loadItem(this.game.gameAchievement.killGreenmuk,"defeat_greenmuck",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GREENMUK_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_GREENMUK_BOSS_DESCRIPTION",_loc1_));
               this.loadItem(this.game.gameAchievement.killBanditLord,"defeat_bandit",Locale.loadStringEx("ACHIEVEMENT_DEFEAT_BANDIT_BOSS_NAME",_loc1_),Locale.loadStringEx("ACHIEVEMENT_DEFEAT_BANDIT_BOSS_DESCRIPTION",_loc1_));
         }
      }
      
      protected function emptyItems() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-H5§.numChildren)
         {
            _loc1_[this.§_-H5§.getChildAt(_loc2_)] = this.§_-H5§.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.destroyThis();
         }
         _loc1_ = null;
      }
      
      protected function createPages() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.pages.numChildren)
         {
            _loc1_[this.pages.getChildAt(_loc2_)] = this.pages.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.destroyThis();
         }
         _loc1_ = null;
         this.pages.addChild(new ButPage(new Point(-275,515),1,this.§_-Du§,this.game));
         this.pages.addChild(new ButPage(new Point(-232,515),2,this.§_-Du§,this.game));
         this.pages.addChild(new ButPage(new Point(-188,515),3,this.§_-Du§,this.game));
         this.pages.addChild(new ButPage(new Point(-144,515),4,this.§_-Du§,this.game));
         if(this.game.pc)
         {
            this.pages.addChild(new ButPage(new Point(-100,515),5,this.§_-Du§,this.game));
         }
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.game.gameSounds.playGUIButtonCommon();
         this.game.map.§_-Gg§();
         this.ytweenOut = new Tween(this,"y",Strong.easeIn,this.y,-550,0.3,true);
         this.ytweenOut.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      protected function §_-Sv§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.butClose.buttonMode = true;
         this.butClose.mouseChildren = false;
         this.butClose.useHandCursor = true;
         this.butClose.gotoAndStop("over");
      }
      
      protected function §_-A-§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.butClose.useHandCursor = false;
         this.butClose.gotoAndStop("idle");
      }
      
      protected function §_-Py§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("press");
      }
      
      protected function §_-Rs§(param1:MouseEvent) : void
      {
         this.butClose.gotoAndStop("idle");
      }
      
      protected function destroyThis() : void
      {
         this.game.map.itemsLocked = false;
         this.§_-P8§ = null;
         this.ytweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.ytweenOut = null;
         this.game = null;
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-A-§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
