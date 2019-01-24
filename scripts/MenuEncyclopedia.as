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
   import flash.net.URLRequest;
   import flash.net.trace;
   import flash.text.TextField;
   import flash.utils.Dictionary;
   import ironhide.utils.tooltip.TooltipEncyclopedia;
   
   public class MenuEncyclopedia extends MovieClip
   {
       
      
      public var ico_enemy_attack:MovieClip;
      
      public var §_-HL§:MovieClip;
      
      public var itemDescription:TextField;
      
      public var §_-71§:MovieClip;
      
      public var itemHealth:TextField;
      
      public var §_-Ks§:MovieClip;
      
      public var § use§:MovieClip;
      
      public var §_-9e§:MovieClip;
      
      public var §_-1c§:MovieClip;
      
      public var itemArmor:TextField;
      
      public var itemSpeed:TextField;
      
      public var butBack:MovieClip;
      
      public var itemMagicRes:TextField;
      
      public var §_-Rc§:TextField;
      
      public var §_-6n§:TextField;
      
      public var §_-M4§:TextField;
      
      public var §_-Sl§:MovieClip;
      
      public var §in §:MovieClip;
      
      public var §_-4j§:MovieClip;
      
      public var §_-Mt§:TextField;
      
      public var §_-4I§:TextField;
      
      public var itemDmg:TextField;
      
      public var butClose:MovieClip;
      
      public var itemsEnemies:Sprite;
      
      public var §_-FY§:Sprite;
      
      public var §_-Ab§:Sprite;
      
      public var selectedItem:int;
      
      public var selectedItemTower:int;
      
      public var §_-8s§:int;
      
      protected var tooltip:TooltipEncyclopedia;
      
      protected var §_-m§:§_-T6§;
      
      protected var buttonEnemies:EncyclopediaButtonEnemies;
      
      protected var §_-EU§:§_-Ei§;
      
      protected var § try§:§_-NV§;
      
      protected var yPosEnemies:int = 157;
      
      protected var yMoveEnemies = 61;
      
      protected var currentEnemies:int = 1;
      
      protected var xPosEnemies:int = -289;
      
      protected var xMoveEnemies:int = 61;
      
      protected var xCurrentPosEnemies:int = -289;
      
      protected var §_-U1§:int = 159;
      
      protected var §_-8K§ = 71;
      
      protected var §_-1K§:int = 1;
      
      protected var §_-M5§:int = -237;
      
      protected var §_-6A§:int = 80;
      
      protected var §_-QI§:int = -237;
      
      protected var §_-KF§:int = 417;
      
      protected var enemiesLoaded:Boolean;
      
      protected var towerLoaded:Boolean;
      
      protected var hintsLoaded:Boolean;
      
      protected var §_-DB§:int;
      
      protected var §_-53§:Boolean;
      
      protected var §_-Lc§:Boolean;
      
      protected var §_-P8§:Tween;
      
      protected var ytweenOut:Tween;
      
      protected var §_-TW§:GameSettings;
      
      protected var inGame:Boolean;
      
      protected var game:Game;
      
      public function MenuEncyclopedia(param1:Game, param2:Boolean = false)
      {
         this.itemsEnemies = new Sprite();
         this.§_-FY§ = new Sprite();
         this.§_-Ab§ = new Sprite();
         super();
         addFrameScript(0,this.frame1);
         this.gotoAndStop("menu");
         this.game = param1;
         this.inGame = param2;
         this.§_-TW§ = new GameSettings(this.game,false);
         this.x = 350;
         this.§_-P8§ = new Tween(this,"y",Strong.easeOut,-550,5,0.5,true);
         this.tooltip = new TooltipEncyclopedia(this,new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5));
         this.§_-m§ = new §_-T6§();
         this.§_-m§.x = -238;
         this.§_-m§.y = 105;
         this.§_-m§.addEventListener(MouseEvent.CLICK,this.§_-K-§,false,0,true);
         this.§_-m§.addEventListener(MouseEvent.ROLL_OVER,this.§_-O9§,false,0,true);
         this.§_-m§.addEventListener(MouseEvent.ROLL_OUT,this.§_-40§,false,0,true);
         this.§_-m§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-TU§,false,0,true);
         this.§_-m§.addEventListener(MouseEvent.MOUSE_UP,this.§_-Pf§,false,0,true);
         this.buttonEnemies = new EncyclopediaButtonEnemies();
         this.buttonEnemies.x = -26;
         this.buttonEnemies.y = 105;
         this.buttonEnemies.addEventListener(MouseEvent.CLICK,this.clickEnemies,false,0,true);
         this.buttonEnemies.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEnemies,false,0,true);
         this.buttonEnemies.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEnemies,false,0,true);
         this.buttonEnemies.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownEnemies,false,0,true);
         this.buttonEnemies.addEventListener(MouseEvent.MOUSE_UP,this.mouseUpEnemies,false,0,true);
         this.§_-EU§ = new §_-Ei§();
         this.§_-EU§.x = -238;
         this.§_-EU§.y = 320;
         this.§_-EU§.addEventListener(MouseEvent.CLICK,this.§_-7o§,false,0,true);
         this.§_-EU§.addEventListener(MouseEvent.ROLL_OVER,this.§_-C1§,false,0,true);
         this.§_-EU§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Nz§,false,0,true);
         this.§_-EU§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ae§,false,0,true);
         this.§_-EU§.addEventListener(MouseEvent.MOUSE_UP,this.§_-7X§,false,0,true);
         this.§ try§ = new §_-NV§();
         this.§ try§.x = -26;
         this.§ try§.y = 320;
         this.§ try§.addEventListener(MouseEvent.CLICK,this.§_-GM§,false,0,true);
         this.§ try§.addEventListener(MouseEvent.ROLL_OVER,this.§ get§,false,0,true);
         this.§ try§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Lj§,false,0,true);
         this.§ try§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Qb§,false,0,true);
         this.§ try§.addEventListener(MouseEvent.MOUSE_UP,this.§_-3I§,false,0,true);
         this.§_-FY§.addChild(this.§_-m§);
         this.§_-FY§.addChild(this.buttonEnemies);
         this.§_-FY§.addChild(this.§_-EU§);
         this.§_-FY§.addChild(this.§ try§);
         this.loadButtons();
         this.butClose.gotoAndStop("idle");
         this.butClose.addEventListener(MouseEvent.CLICK,this.close,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§,false,0,true);
         this.butClose.addEventListener(MouseEvent.ROLL_OUT,this.§_-A-§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§,false,0,true);
         this.butClose.addEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§,false,0,true);
         this.§_-1c§.gotoAndStop("idle");
         this.§_-1c§.addEventListener(MouseEvent.CLICK,this.§_-Ou§,false,0,true);
         this.§_-1c§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Jw§,false,0,true);
         this.§_-1c§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Oj§,false,0,true);
         this.§_-1c§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-BV§,false,0,true);
         this.§_-1c§.addEventListener(MouseEvent.MOUSE_UP,this.§in§,false,0,true);
         this.§ use§.gotoAndStop("idle");
         this.§ use§.addEventListener(MouseEvent.CLICK,this.§_-29§,false,0,true);
         this.§ use§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Kr§,false,0,true);
         this.§ use§.addEventListener(MouseEvent.ROLL_OUT,this.§_-7g§,false,0,true);
         this.§ use§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-8R§,false,0,true);
         this.§ use§.addEventListener(MouseEvent.MOUSE_UP,this.§_-2T§,false,0,true);
         this.butBack.gotoAndStop("idle");
         this.butBack.addEventListener(MouseEvent.CLICK,this.§_-QO§,false,0,true);
         this.butBack.addEventListener(MouseEvent.ROLL_OVER,this.§else §,false,0,true);
         this.butBack.addEventListener(MouseEvent.ROLL_OUT,this.§_-CE§,false,0,true);
         this.butBack.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§,false,0,true);
         this.butBack.addEventListener(MouseEvent.MOUSE_UP,this.§_-JT§,false,0,true);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      protected function init(param1:Event) : void
      {
      }
      
      protected function loadButtons() : void
      {
         this.addChild(this.§_-FY§);
         this.butBack.visible = false;
      }
      
      public function unSelectEnemy() : void
      {
         if(this.selectedItem != 0)
         {
            MovieClip(this.itemsEnemies.getChildAt(this.selectedItem - 1)).state.gotoAndStop("idle");
         }
      }
      
      public function §implements§() : void
      {
         if(this.selectedItemTower != 0)
         {
            MovieClip(this.§_-Ab§.getChildAt(this.selectedItemTower - 1)).state.gotoAndStop("idle");
         }
      }
      
      protected function loadEnemies() : void
      {
         var _loc1_:String = Locale.getDefaultLang();
         this.loadItemEnemies(true,Locale.loadStringEx("ENEMY_GOBLIN_NAME",_loc1_),Locale.loadStringEx("ENEMY_GOBLIN_DESCRIPTION",_loc1_),this.§_-TW§.enemies.goblin.health,this.§_-TW§.enemies.goblin.minDamage + "-" + this.§_-TW§.enemies.goblin.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblin.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblin.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.goblin.speed),this.§_-TW§.enemies.goblin.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyFatOrc,Locale.loadStringEx("ENEMY_FAT_ORC_NAME",_loc1_),Locale.loadStringEx("ENEMY_FAT_ORC_DESCRIPTION",_loc1_),this.§_-TW§.enemies.fatOrc.health,this.§_-TW§.enemies.fatOrc.minDamage + "-" + this.§_-TW§.enemies.fatOrc.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.fatOrc.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.fatOrc.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.fatOrc.speed),this.§_-TW§.enemies.fatOrc.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyShaman,Locale.loadStringEx("ENEMY_SHAMAN_NAME",_loc1_),Locale.loadStringEx("ENEMY_SHAMAN_DESCRIPTION",_loc1_),this.§_-TW§.enemies.shaman.health,this.§_-TW§.enemies.shaman.minDamage + "-" + this.§_-TW§.enemies.shaman.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.shaman.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.shaman.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.shaman.speed),this.§_-TW§.enemies.shaman.cost,Locale.loadStringEx("ENEMY_SHAMAN_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyOgre,Locale.loadStringEx("ENEMY_OGRE_NAME",_loc1_),Locale.loadStringEx("ENEMY_OGRE_DESCRIPTION",_loc1_),this.§_-TW§.enemies.ogre.health,this.§_-TW§.enemies.ogre.minDamage + "-" + this.§_-TW§.enemies.ogre.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.ogre.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.ogre.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.ogre.speed),this.§_-TW§.enemies.ogre.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyBandit,Locale.loadStringEx("ENEMY_BANDIT_NAME",_loc1_),Locale.loadStringEx("ENEMY_BANDIT_DESCRIPTION",_loc1_),this.§_-TW§.enemies.bandit.health,this.§_-TW§.enemies.bandit.minDamage + "-" + this.§_-TW§.enemies.bandit.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.bandit.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.bandit.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.bandit.speed),this.§_-TW§.enemies.bandit.cost,Locale.loadStringEx("ENEMY_BANDIT_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyBrigand,Locale.loadStringEx("ENEMY_BRIGAND_NAME",_loc1_),Locale.loadStringEx("ENEMY_BRIGAND_DESCRIPTION",_loc1_),this.§_-TW§.enemies.brigand.health,this.§_-TW§.enemies.brigand.minDamage + "-" + this.§_-TW§.enemies.brigand.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.brigand.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.brigand.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.brigand.speed),this.§_-TW§.enemies.brigand.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyMarauder,Locale.loadStringEx("ENEMY_MARAUDER_NAME",_loc1_),Locale.loadStringEx("ENEMY_MARAUDER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.marauder.health,this.§_-TW§.enemies.marauder.minDamage + "-" + this.§_-TW§.enemies.marauder.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.marauder.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.marauder.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.marauder.speed),this.§_-TW§.enemies.marauder.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySpiderSmall,Locale.loadStringEx("ENEMY_SPIDERSMALL_NAME",_loc1_),Locale.loadStringEx("ENEMY_SPIDERSMALL_DESCRIPTION",_loc1_),this.§_-TW§.enemies.spiderSmall.health,this.§_-TW§.enemies.spiderSmall.minDamage + "-" + this.§_-TW§.enemies.spiderSmall.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.spiderSmall.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.spiderSmall.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.spiderSmall.speed),this.§_-TW§.enemies.spiderSmall.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySpider,Locale.loadStringEx("ENEMY_SPIDER_NAME",_loc1_),Locale.loadStringEx("ENEMY_SPIDER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.spider.health,this.§_-TW§.enemies.spider.minDamage + "-" + this.§_-TW§.enemies.spider.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.spider.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.spider.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.spider.speed),this.§_-TW§.enemies.spider.cost,Locale.loadStringEx("ENEMY_SPIDER_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyGargoyle,Locale.loadStringEx("ENEMY_GARGOYLE_NAME",_loc1_),Locale.loadStringEx("ENEMY_GARGOYLE_DESCRIPTION",_loc1_),this.§_-TW§.enemies.gargoyle.health,this.§_-TW§.enemies.gargoyle.minDamage + "-" + this.§_-TW§.enemies.gargoyle.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.gargoyle.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.gargoyle.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.gargoyle.speed),this.§_-TW§.enemies.gargoyle.cost,Locale.loadStringEx("ENEMY_GARGOYLE_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyShadowArcher,Locale.loadStringEx("ENEMY_SHADOW_ARCHER_NAME",_loc1_),Locale.loadStringEx("ENEMY_SHADOW_ARCHER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.shadowArcher.health,this.§_-TW§.enemies.shadowArcher.minDamage + "-" + this.§_-TW§.enemies.shadowArcher.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.shadowArcher.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.shadowArcher.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.shadowArcher.speed),this.§_-TW§.enemies.shadowArcher.cost,Locale.loadStringEx("ENEMY_SHADOW_ARCHER_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDarkKnight,Locale.loadStringEx("ENEMY_DARK_NIGHT_NAME",_loc1_),Locale.loadStringEx("ENEMY_DARK_NIGHT_DESCRIPTION",_loc1_),this.§_-TW§.enemies.darkKnight.health,this.§_-TW§.enemies.darkKnight.minDamage + "-" + this.§_-TW§.enemies.darkKnight.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.darkKnight.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.darkKnight.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.darkKnight.speed),this.§_-TW§.enemies.darkKnight.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySmallWolf,Locale.loadStringEx("ENEMY_WULF_NAME",_loc1_),Locale.loadStringEx("ENEMY_WULF_DESCRIPTION",_loc1_),this.§_-TW§.enemies.wolfSmall.health,this.§_-TW§.enemies.wolfSmall.minDamage + "-" + this.§_-TW§.enemies.wolfSmall.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.wolfSmall.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.wolfSmall.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.wolfSmall.speed),this.§_-TW§.enemies.wolfSmall.cost,Locale.loadStringEx("ENEMY_WULF_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyWolf,Locale.loadStringEx("ENEMY_WORG_NAME",_loc1_),Locale.loadStringEx("ENEMY_WORG_DESCRIPTION",_loc1_),this.§_-TW§.enemies.wolf.health,this.§_-TW§.enemies.wolf.minDamage + "-" + this.§_-TW§.enemies.wolf.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.wolf.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.wolf.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.wolf.speed),this.§_-TW§.enemies.wolf.cost,Locale.loadStringEx("ENEMY_WORG_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyGolemHead,Locale.loadStringEx("ENEMY_GOLEM_HEAD_NAME",_loc1_),Locale.loadStringEx("ENEMY_GOLEM_HEAD_DESCRIPTION",_loc1_),this.§_-TW§.enemies.golemHead.health,this.§_-TW§.enemies.golemHead.minDamage + "-" + this.§_-TW§.enemies.golemHead.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.golemHead.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.golemHead.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.golemHead.speed),this.§_-TW§.enemies.golemHead.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyWhiteWolf,Locale.loadStringEx("ENEMY_WHITE_WOLF_NAME",_loc1_),Locale.loadStringEx("ENEMY_WHITE_WOLF_DESCRIPTION",_loc1_),this.§_-TW§.enemies.whiteWolf.health,this.§_-TW§.enemies.whiteWolf.minDamage + "-" + this.§_-TW§.enemies.whiteWolf.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.whiteWolf.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.whiteWolf.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.whiteWolf.speed),this.§_-TW§.enemies.whiteWolf.cost,Locale.loadStringEx("ENEMY_WHITE_WOLF_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyTroll,Locale.loadStringEx("ENEMY_TROLL_NAME",_loc1_),Locale.loadStringEx("ENEMY_TROLL_DESCRIPTION",_loc1_),this.§_-TW§.enemies.troll.health,this.§_-TW§.enemies.troll.minDamage + "-" + this.§_-TW§.enemies.troll.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.troll.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.troll.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.troll.speed),this.§_-TW§.enemies.troll.cost,Locale.loadStringEx("ENEMY_TROLL_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyTrollAxeThrower,Locale.loadStringEx("ENEMY_TROLL_AXE_THROWER_NAME",_loc1_),Locale.loadStringEx("ENEMY_TROLL_AXE_THROWER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.trollAxeThrower.health,this.§_-TW§.enemies.trollAxeThrower.minDamage + "-" + this.§_-TW§.enemies.trollAxeThrower.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.trollAxeThrower.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.trollAxeThrower.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.trollAxeThrower.speed),this.§_-TW§.enemies.trollAxeThrower.cost,Locale.loadStringEx("ENEMY_TROLL_AXE_THROWER_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyTrollChieftain,Locale.loadStringEx("ENEMY_TROLL_CHIEFTAIN_NAME",_loc1_),Locale.loadStringEx("ENEMY_TROLL_CHIEFTAIN_DESCRIPTION",_loc1_),this.§_-TW§.enemies.trollChieftain.health,this.§_-TW§.enemies.trollChieftain.minDamage + "-" + this.§_-TW§.enemies.trollChieftain.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.trollChieftain.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.trollChieftain.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.trollChieftain.speed),this.§_-TW§.enemies.trollChieftain.cost,Locale.loadStringEx("ENEMY_TROLL_CHIEFTAIN_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyYeti,Locale.loadStringEx("ENEMY_YETI_NAME",_loc1_),Locale.loadStringEx("ENEMY_YETI_DESCRIPTION",_loc1_),this.§_-TW§.enemies.yeti.health,this.§_-TW§.enemies.yeti.minDamage + "-" + this.§_-TW§.enemies.yeti.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.yeti.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.yeti.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.yeti.speed),this.§_-TW§.enemies.yeti.cost,Locale.loadStringEx("ENEMY_YETI_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyRocketeer,Locale.loadStringEx("ENEMY_ROCKETEER_NAME",_loc1_),Locale.loadStringEx("ENEMY_ROCKETEER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.rocketeer.health,this.§_-TW§.enemies.rocketeer.minDamage + "-" + this.§_-TW§.enemies.rocketeer.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.rocketeer.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.rocketeer.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.rocketeer.speed),this.§_-TW§.enemies.rocketeer.cost,Locale.loadStringEx("ENEMY_ROCKETEER_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDarkSlayer,Locale.loadStringEx("ENEMY_SLAYER_NAME",_loc1_),Locale.loadStringEx("ENEMY_SLAYER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.slayer.health,this.§_-TW§.enemies.slayer.minDamage + "-" + this.§_-TW§.enemies.slayer.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.slayer.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.slayer.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.slayer.speed),this.§_-TW§.enemies.slayer.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDemon,Locale.loadStringEx("ENEMY_DEMON_NAME",_loc1_),Locale.loadStringEx("ENEMY_DEMON_DESCRIPTION",_loc1_),this.§_-TW§.enemies.demon.health,this.§_-TW§.enemies.demon.minDamage + "-" + this.§_-TW§.enemies.demon.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.demon.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.demon.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.demon.speed),this.§_-TW§.enemies.demon.cost,Locale.loadStringEx("ENEMY_DEMON_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDemonMage,Locale.loadStringEx("ENEMY_DEMON_MAGE_NAME",_loc1_),Locale.loadStringEx("ENEMY_DEMON_MAGE_DESCRIPTION",_loc1_),this.§_-TW§.enemies.demonMage.health,this.§_-TW§.enemies.demonMage.minDamage + "-" + this.§_-TW§.enemies.demonMage.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonMage.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonMage.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.demonMage.speed),this.§_-TW§.enemies.demonMage.cost,Locale.loadStringEx("ENEMY_DEMON_MAGE_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDemonWolf,Locale.loadStringEx("ENEMY_DEMON_WOLF_NAME",_loc1_),Locale.loadStringEx("ENEMY_DEMON_WOLF_DESCRIPTION",_loc1_),this.§_-TW§.enemies.demonWolf.health,this.§_-TW§.enemies.demonWolf.minDamage + "-" + this.§_-TW§.enemies.demonWolf.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonWolf.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonWolf.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.demonWolf.speed),this.§_-TW§.enemies.demonWolf.cost,Locale.loadStringEx("ENEMY_DEMON_WOLF_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyDemonImp,Locale.loadStringEx("ENEMY_DEMON_IMP_NAME",_loc1_),Locale.loadStringEx("ENEMY_DEMON_IMP_DESCRIPTION",_loc1_),this.§_-TW§.enemies.demonImp.health,this.§_-TW§.enemies.demonImp.minDamage + "-" + this.§_-TW§.enemies.demonImp.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonImp.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.demonImp.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.demonImp.speed),this.§_-TW§.enemies.demonImp.cost,Locale.loadStringEx("ENEMY_DEMON_IMP_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySkeletor,Locale.loadStringEx("ENEMY_SKELETON_NAME",_loc1_),Locale.loadStringEx("ENEMY_SKELETON_DESCRIPTION",_loc1_),this.§_-TW§.enemies.skeleton.health,this.§_-TW§.enemies.skeleton.minDamage + "-" + this.§_-TW§.enemies.skeleton.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.skeleton.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.skeleton.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.skeleton.speed),this.§_-TW§.enemies.skeleton.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySkeletorBig,Locale.loadStringEx("ENEMY_SKELETON_BIG_NAME",_loc1_),Locale.loadStringEx("ENEMY_SKELETON_BIG_DESCRIPTION",_loc1_),this.§_-TW§.enemies.skeletonBig.health,this.§_-TW§.enemies.skeletonBig.minDamage + "-" + this.§_-TW§.enemies.skeletonBig.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.skeletonBig.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.skeletonBig.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.skeletonBig.speed),this.§_-TW§.enemies.skeletonBig.cost,"");
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyNecromancer,Locale.loadStringEx("ENEMY_NECROMANCER_NAME",_loc1_),Locale.loadStringEx("ENEMY_NECROMANCER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.necromancer.health,this.§_-TW§.enemies.necromancer.minDamage + "-" + this.§_-TW§.enemies.necromancer.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.necromancer.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.necromancer.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.necromancer.speed),this.§_-TW§.enemies.necromancer.cost,Locale.loadStringEx("ENEMY_NECROMANCER_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyLavaElemental,Locale.loadStringEx("ENEMY_LAVA_ELEMENTAL_NAME",_loc1_),Locale.loadStringEx("ENEMY_LAVA_ELEMENTAL_DESCRIPTION",_loc1_),this.§_-TW§.enemies.lavaElemental.health,this.§_-TW§.enemies.lavaElemental.minDamage + "-" + this.§_-TW§.enemies.lavaElemental.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.lavaElemental.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.lavaElemental.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.lavaElemental.speed),this.§_-TW§.enemies.lavaElemental.cost,Locale.loadStringEx("ENEMY_LAVA_ELEMENTAL_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyJuggernaut,Locale.loadStringEx("ENEMY_JUGGERNAUT_NAME",_loc1_),Locale.loadStringEx("ENEMY_JUGGERNAUT_DESCRIPTION",_loc1_),this.§_-TW§.enemies.juggernaut.health,this.§_-TW§.enemies.juggernaut.minDamage + "-" + this.§_-TW§.enemies.juggernaut.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.juggernaut.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.juggernaut.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.juggernaut.speed),this.§_-TW§.enemies.juggernaut.cost,Locale.loadStringEx("ENEMY_JUGGERNAUT_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyYetiBoss,Locale.loadStringEx("ENEMY_YETI_BOSS_NAME",_loc1_),Locale.loadStringEx("ENEMY_YETI_BOSS_DESCRIPTION",_loc1_),this.§_-TW§.enemies.yetiBoss.health,this.§_-TW§.enemies.yetiBoss.minDamage + "-" + this.§_-TW§.enemies.yetiBoss.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.yetiBoss.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.yetiBoss.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.yetiBoss.speed),this.§_-TW§.enemies.yetiBoss.cost,Locale.loadStringEx("ENEMY_YETI_BOSS_SPECIAL",_loc1_));
         this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyVeznan,Locale.loadStringEx("ENEMY_VEZNAN_NAME",_loc1_),Locale.loadStringEx("ENEMY_VEZNAN_DESCRIPTION",_loc1_),this.§_-TW§.enemies.veznan.health,this.§_-TW§.enemies.veznan.minDamage + "-" + this.§_-TW§.enemies.veznan.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.veznan.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.veznan.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.veznan.speed),this.§_-TW§.enemies.veznan.cost,Locale.loadStringEx("ENEMY_VEZNAN_SPECIAL",_loc1_));
         if(this.game.pc)
         {
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySarelgazSmall,Locale.loadStringEx("ENEMY_SARELGAZ_SMALL_NAME",_loc1_),Locale.loadStringEx("ENEMY_SARELGAZ_SMALL_DESCRIPTION",_loc1_),this.§_-TW§.enemies.sarelgazSmall.health,this.§_-TW§.enemies.sarelgazSmall.minDamage + "-" + this.§_-TW§.enemies.sarelgazSmall.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.sarelgazSmall.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.sarelgazSmall.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.sarelgazSmall.speed),this.§_-TW§.enemies.sarelgazSmall.cost,Locale.loadStringEx("ENEMY_SARELGAZ_SMALL_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySarelgaz,Locale.loadStringEx("ENEMY_SARELGAZ_NAME",_loc1_),Locale.loadStringEx("ENEMY_SARELGAZ_DESCRIPTION",_loc1_),this.§_-TW§.enemies.sarelgaz.health,this.§_-TW§.enemies.sarelgaz.minDamage + "-" + this.§_-TW§.enemies.sarelgaz.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.sarelgaz.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.sarelgaz.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.sarelgaz.speed),this.§_-TW§.enemies.sarelgaz.cost,Locale.loadStringEx("ENEMY_SARELGAZ_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyGoblinZapper,Locale.loadStringEx("ENEMY_GOBLIN_ZAPPER_NAME",_loc1_),Locale.loadStringEx("ENEMY_GOBLIN_ZAPPER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.goblinZapper.health,this.§_-TW§.enemies.goblinZapper.minDamage + "-" + this.§_-TW§.enemies.goblinZapper.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblinZapper.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblinZapper.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.goblinZapper.speed),this.§_-TW§.enemies.goblinZapper.cost,Locale.loadStringEx("ENEMY_GOBLIN_ZAPPER_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyOrcArmored,Locale.loadStringEx("ENEMY_ORC_ARMORED_NAME",_loc1_),Locale.loadStringEx("ENEMY_ORC_ARMORED_DESCRIPTION",_loc1_),this.§_-TW§.enemies.orcArmored.health,this.§_-TW§.enemies.orcArmored.minDamage + "-" + this.§_-TW§.enemies.orcArmored.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.orcArmored.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.orcArmored.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.orcArmored.speed),this.§_-TW§.enemies.orcArmored.cost,Locale.loadStringEx("ENEMY_ORC_ARMORED_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyOrcWolfRider,Locale.loadStringEx("ENEMY_ORC_WOLF_RIDER_NAME",_loc1_),Locale.loadStringEx("ENEMY_ORC_WOLF_RIDER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.orcWolfRider.health,this.§_-TW§.enemies.orcWolfRider.minDamage + "-" + this.§_-TW§.enemies.orcWolfRider.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.orcWolfRider.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.orcWolfRider.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.orcWolfRider.speed),this.§_-TW§.enemies.orcWolfRider.cost,Locale.loadStringEx("ENEMY_ORC_WOLF_RIDER_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyForestTroll,Locale.loadStringEx("ENEMY_FOREST_TROLL_NAME",_loc1_),Locale.loadStringEx("ENEMY_FOREST_TROLL_DESCRIPTION",_loc1_),this.§_-TW§.enemies.forestTroll.health,this.§_-TW§.enemies.forestTroll.minDamage + "-" + this.§_-TW§.enemies.forestTroll.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.forestTroll.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.forestTroll.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.forestTroll.speed),this.§_-TW§.enemies.forestTroll.cost,Locale.loadStringEx("ENEMY_FOREST_TROLL_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyBossGoblinChieftain,Locale.loadStringEx("ENEMY_BOSS_GOBLIN_CHIEFTAIN_NAME",_loc1_),Locale.loadStringEx("ENEMY_BOSS_GOBLIN_CHIEFTAIN_DESCRIPTION",_loc1_),this.§_-TW§.enemies.goblinChieftain.health,this.§_-TW§.enemies.goblinChieftain.minDamage + "-" + this.§_-TW§.enemies.goblinChieftain.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblinChieftain.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.goblinChieftain.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.goblinChieftain.speed),this.§_-TW§.enemies.goblinChieftain.cost,Locale.loadStringEx("ENEMY_BOSS_GOBLIN_CHIEFTAIN_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyZombie,Locale.loadStringEx("ENEMY_ZOMBIE_NAME",_loc1_),Locale.loadStringEx("ENEMY_ZOMBIE_DESCRIPTION",_loc1_),this.§_-TW§.enemies.zombie.health,this.§_-TW§.enemies.zombie.minDamage + "-" + this.§_-TW§.enemies.zombie.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.zombie.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.zombie.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.zombie.speed),this.§_-TW§.enemies.zombie.cost,Locale.loadStringEx("ENEMY_ZOMBIE_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyRottenSpider,Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_NAME",_loc1_),Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.rottenSpider.health,this.§_-TW§.enemies.rottenSpider.minDamage + "-" + this.§_-TW§.enemies.rottenSpider.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenSpider.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenSpider.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.rottenSpider.speed),this.§_-TW§.enemies.rottenSpider.cost,Locale.loadStringEx("ENEMY_ROTTEN_SPIDER_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyRottenTree,Locale.loadStringEx("ENEMY_ROTTEN_TREE_NAME",_loc1_),Locale.loadStringEx("ENEMY_ROTTEN_TREE_DESCRIPTION",_loc1_),this.§_-TW§.enemies.rottenTree.health,this.§_-TW§.enemies.rottenTree.minDamage + "-" + this.§_-TW§.enemies.rottenTree.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenTree.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenTree.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.rottenTree.speed),this.§_-TW§.enemies.rottenTree.cost,Locale.loadStringEx("ENEMY_ROTTEN_TREE_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemySwampThing,Locale.loadStringEx("ENEMY_THE_THING_NAME",_loc1_),Locale.loadStringEx("ENEMY_THE_THING_DESCRIPTION",_loc1_),this.§_-TW§.enemies.theThing.health,this.§_-TW§.enemies.theThing.minDamage + "-" + this.§_-TW§.enemies.theThing.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.theThing.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.theThing.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.theThing.speed),this.§_-TW§.enemies.theThing.cost,Locale.loadStringEx("ENEMY_THE_THING_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyBossGreenmuck,Locale.loadStringEx("ENEMY_ROTTEN_TREE_BOSS_NAME",_loc1_),Locale.loadStringEx("ENEMY_ROTTEN_TREE_BOSS_DESCRIPTION",_loc1_),this.§_-TW§.enemies.rottenBoss.health,this.§_-TW§.enemies.rottenBoss.minDamage + "-" + this.§_-TW§.enemies.rottenBoss.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenBoss.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.rottenBoss.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.rottenBoss.speed),this.§_-TW§.enemies.rottenBoss.cost,Locale.loadStringEx("ENEMY_ROTTEN_TREE_BOSS_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyRaider,Locale.loadStringEx("ENEMY_RAIDER_NAME",_loc1_),Locale.loadStringEx("ENEMY_RAIDER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.raider.health,this.§_-TW§.enemies.raider.minDamage + "-" + this.§_-TW§.enemies.raider.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.raider.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.raider.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.raider.speed),this.§_-TW§.enemies.raider.cost,Locale.loadStringEx("ENEMY_RAIDER_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyPillager,Locale.loadStringEx("ENEMY_PILLAGER_NAME",_loc1_),Locale.loadStringEx("ENEMY_PILLAGER_DESCRIPTION",_loc1_),this.§_-TW§.enemies.pillager.health,this.§_-TW§.enemies.pillager.minDamage + "-" + this.§_-TW§.enemies.pillager.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.pillager.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.pillager.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.pillager.speed),this.§_-TW§.enemies.pillager.cost,Locale.loadStringEx("ENEMY_PILLAGER_SPECIAL",_loc1_));
            this.loadItemEnemies(this.game.gameEncyclopedia.notificationEnemyBossBandit,Locale.loadStringEx("ENEMY_BANDIT_BOSS_NAME",_loc1_),Locale.loadStringEx("ENEMY_BANDIT_BOSS_DESCRIPTION",_loc1_),this.§_-TW§.enemies.bossBandit.health,this.§_-TW§.enemies.bossBandit.minDamage + "-" + this.§_-TW§.enemies.bossBandit.maxDamage,this.§_-TW§.getArmorString(this.§_-TW§.enemies.bossBandit.armor),this.§_-TW§.getArmorString(this.§_-TW§.enemies.bossBandit.magicArmor),this.§_-TW§.getSpeedString(this.§_-TW§.enemies.bossBandit.speed),this.§_-TW§.enemies.bossBandit.cost,Locale.loadStringEx("ENEMY_BANDIT_BOSS_SPECIAL",_loc1_));
         }
         this.enemiesLoaded = true;
      }
      
      protected function loadItemEnemies(param1:Boolean, param2:String, param3:String, param4:String, param5:String, param6:String, param7:String, param8:String, param9:String, param10:String) : void
      {
         var _loc11_:Point = new Point();
         if(this.currentEnemies != 1 && (this.currentEnemies - 1) % 7 == 0)
         {
            this.xCurrentPosEnemies = this.xPosEnemies;
            this.yPosEnemies = this.yPosEnemies + this.yMoveEnemies;
         }
         _loc11_.x = this.xCurrentPosEnemies;
         _loc11_.y = this.yPosEnemies;
         this.itemsEnemies.addChild(new MenuEncyclopediaPolaroidEnemy(this.game,this,param1,_loc11_,this.currentEnemies,param2,param3,param4,param5,param6,param7,param8,param9,param10));
         this.xCurrentPosEnemies = this.xCurrentPosEnemies + this.xMoveEnemies;
         this.currentEnemies++;
      }
      
      protected function loadTowers() : void
      {
         var _loc1_:String = Locale.getDefaultLang();
         this.loadItemTowers(true,Locale.loadStringEx("TOWER_ARCHERS_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCHERS_DESCRIPTION",_loc1_),1,1,this.§_-TW§.archers.level1.minDamage + "-" + this.§_-TW§.archers.level1.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.archers.level1.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.archers.level1.range),"","","","");
         this.loadItemTowers(true,Locale.loadStringEx("TOWER_BARRACKS_NAME",_loc1_),Locale.loadStringEx("TOWER_BARRACKS_DESCRIPTION",_loc1_),2,1,this.§_-TW§.soldiers.level1.minDamage + "-" + this.§_-TW§.soldiers.level1.maxDamage,"","",this.§_-TW§.soldiers.level1.health,this.§_-TW§.getArmorString(this.§_-TW§.soldiers.level1.armor),(this.§_-TW§.soldiers.level1.respawn / this.§_-TW§.framesRate).toString(),"");
         this.loadItemTowers(true,Locale.loadStringEx("TOWER_MAGES_NAME",_loc1_),Locale.loadStringEx("TOWER_MAGES_DESCRIPTION",_loc1_),1,2,this.§_-TW§.mages.level1.minDamage + "-" + this.§_-TW§.mages.level1.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.mages.level1.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.mages.level1.range),"","","","");
         this.loadItemTowers(true,Locale.loadStringEx("TOWER_ENGINEERS_NAME",_loc1_),Locale.loadStringEx("TOWER_ENGINEERS_DESCRIPTION",_loc1_),1,1,this.§_-TW§.engineers.level1.minDamage + "-" + this.§_-TW§.engineers.level1.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.engineers.level1.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.engineers.level1.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerArchersLevel2,Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL2_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),1,1,this.§_-TW§.archers.level2.minDamage + "-" + this.§_-TW§.archers.level2.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.archers.level2.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.archers.level2.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerSoldiersLevel2,Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL2_NAME",_loc1_),Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),2,1,this.§_-TW§.soldiers.level2.minDamage + "-" + this.§_-TW§.soldiers.level2.maxDamage,"","",this.§_-TW§.soldiers.level2.health,this.§_-TW§.getArmorString(this.§_-TW§.soldiers.level2.armor),(this.§_-TW§.soldiers.level2.respawn / this.§_-TW§.framesRate).toString(),"");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerMagesLevel2,Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_NAME",_loc1_),Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),1,2,this.§_-TW§.mages.level2.minDamage + "-" + this.§_-TW§.mages.level2.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.mages.level2.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.mages.level2.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerEngineersLevel2,Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_NAME",_loc1_),Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL2_DESCRIPTION",_loc1_),1,1,this.§_-TW§.engineers.level2.minDamage + "-" + this.§_-TW§.engineers.level2.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.engineers.level2.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.engineers.level2.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerArchersLevel3,Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL3_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCHERS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),1,1,this.§_-TW§.archers.level3.minDamage + "-" + this.§_-TW§.archers.level3.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.archers.level3.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.archers.level3.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerSoldiersLevel3,Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL3_NAME",_loc1_),Locale.loadStringEx("TOWER_BARRACKS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),2,1,this.§_-TW§.soldiers.level3.minDamage + "-" + this.§_-TW§.soldiers.level3.maxDamage,"","",this.§_-TW§.soldiers.level3.health,this.§_-TW§.getArmorString(this.§_-TW§.soldiers.level3.armor),(this.§_-TW§.soldiers.level3.respawn / this.§_-TW§.framesRate).toString(),"");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerMagesLevel3,Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_NAME",_loc1_),Locale.loadStringEx("TOWER_MAGES_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),1,2,this.§_-TW§.mages.level3.minDamage + "-" + this.§_-TW§.mages.level3.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.mages.level3.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.mages.level3.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerEngineersLevel3,Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_NAME",_loc1_),Locale.loadStringEx("TOWER_ENGINEERS_UPGRADE_LEVEL3_DESCRIPTION",_loc1_),1,1,this.§_-TW§.engineers.level3.minDamage + "-" + this.§_-TW§.engineers.level3.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.engineers.level3.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.engineers.level3.range),"","","","");
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerArchersRanger,Locale.loadStringEx("TOWER_RANGERS_NAME",_loc1_),Locale.loadStringEx("TOWER_RANGERS_DESCRIPTION",_loc1_),1,1,this.§_-TW§.archers.ranger.minDamage + "-" + this.§_-TW§.archers.ranger.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.archers.ranger.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.archers.ranger.range),"","","",Locale.loadStringEx("TOWER_RANGERS_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerSoldiersPaladin,Locale.loadStringEx("TOWER_PALADINS_NAME",_loc1_),Locale.loadStringEx("TOWER_PALADINS_DESCRIPTION",_loc1_),2,1,this.§_-TW§.soldiers.paladin.minDamage + "-" + this.§_-TW§.soldiers.paladin.maxDamage,"","",this.§_-TW§.soldiers.paladin.health,this.§_-TW§.getArmorString(this.§_-TW§.soldiers.paladin.armor),(this.§_-TW§.soldiers.paladin.respawn / this.§_-TW§.framesRate).toString(),Locale.loadStringEx("TOWER_PALADINS_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerMagesArcane,Locale.loadStringEx("TOWER_ARCANE_NAME",_loc1_),Locale.loadStringEx("TOWER_ARCANE_DESCRIPTION",_loc1_),1,2,this.§_-TW§.mages.arcane.minDamage + "-" + this.§_-TW§.mages.arcane.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.mages.arcane.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.mages.arcane.range),"","","",Locale.loadStringEx("TOWER_ARCANE_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerEngineersBfg,Locale.loadStringEx("TOWER_BFG_NAME",_loc1_),Locale.loadStringEx("TOWER_BFG_DESCRIPTION",_loc1_),1,1,this.§_-TW§.engineers.bfg.minDamage + "-" + this.§_-TW§.engineers.bfg.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.engineers.bfg.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.engineers.bfg.range),"","","",Locale.loadStringEx("TOWER_BFG_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerArchersMusketeer,Locale.loadStringEx("TOWER_MUSKETEERS_NAME",_loc1_),Locale.loadStringEx("TOWER_MUSKETEERS_DESCRIPTION",_loc1_),1,1,this.§_-TW§.archers.musketeer.minDamage + "-" + this.§_-TW§.archers.musketeer.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.archers.musketeer.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.archers.musketeer.range),"","","",Locale.loadStringEx("TOWER_MUSKETEERS_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerSoldiersBarbarian,Locale.loadStringEx("TOWER_BARBARIANS_NAME",_loc1_),Locale.loadStringEx("TOWER_BARBARIANS_DESCRIPTION",_loc1_),2,1,this.§_-TW§.soldiers.barbarian.minDamage + "-" + this.§_-TW§.soldiers.barbarian.maxDamage,"","",this.§_-TW§.soldiers.barbarian.health,this.§_-TW§.getArmorString(this.§_-TW§.soldiers.barbarian.armor),(this.§_-TW§.soldiers.barbarian.respawn / this.§_-TW§.framesRate).toString(),Locale.loadStringEx("TOWER_BARBARIANS_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerMagesSorcerer,Locale.loadStringEx("TOWER_SORCERER_NAME",_loc1_),Locale.loadStringEx("TOWER_SORCERER_DESCRIPTION",_loc1_),1,2,this.§_-TW§.mages.sorcerer.minDamage + "-" + this.§_-TW§.mages.sorcerer.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.mages.sorcerer.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.mages.sorcerer.range),"","","",Locale.loadStringEx("TOWER_SORCERER_SPECIAL",_loc1_));
         this.loadItemTowers(this.game.gameEncyclopedia.notificationTowerEngineersTesla,Locale.loadStringEx("TOWER_TESLA_NAME",_loc1_),Locale.loadStringEx("TOWER_TESLA_DESCRIPTION",_loc1_),1,1,this.§_-TW§.engineers.tesla.minDamage + "-" + this.§_-TW§.engineers.tesla.maxDamage,this.§_-TW§.getReloadString(this.§_-TW§.engineers.tesla.reload / this.§_-TW§.framesRate),this.§_-TW§.getRangeString(this.§_-TW§.engineers.tesla.range),"","","",Locale.loadStringEx("TOWER_TESLA_SPECIAL",_loc1_));
         this.towerLoaded = true;
      }
      
      protected function loadTips() : void
      {
         this.§_-T9§(1);
      }
      
      protected function §_-T9§(param1:int) : void
      {
         this.§_-DB§ = param1;
         this.§_-4I§.text = this.§_-DB§.toString() + "/" + this.game.tips.toString();
         this.§_-Mt§.text = Locale.loadStringEx("TIP_" + this.§_-DB§,Locale.getDefaultLang());
         if(this.§_-DB§ == 1)
         {
            this.§_-C8§();
         }
         else
         {
            this.enabledPrevTip();
         }
         if(this.§_-DB§ == this.game.tips)
         {
            this.§_-Hp§();
         }
         else
         {
            this.enabledNextTip();
         }
      }
      
      protected function enabledPrevTip() : void
      {
         this.§_-Lc§ = true;
         this.§ use§.alpha = 1;
      }
      
      protected function §_-C8§() : void
      {
         this.§_-Lc§ = false;
         this.§ use§.alpha = 0.3;
         this.§ use§.useHandCursor = false;
      }
      
      protected function enabledNextTip() : void
      {
         this.§_-53§ = true;
         this.§_-1c§.alpha = 1;
      }
      
      protected function §_-Hp§() : void
      {
         this.§_-53§ = false;
         this.§_-1c§.alpha = 0.3;
         this.§_-1c§.useHandCursor = false;
      }
      
      protected function loadItemTowers(param1:Boolean, param2:String, param3:String, param4:int, param5:int, param6:String, param7:String, param8:String, param9:String, param10:String, param11:String, param12:String) : void
      {
         var _loc13_:Point = new Point();
         if(this.§_-1K§ != 1 && (this.§_-1K§ - 1) % 4 == 0)
         {
            if((this.§_-1K§ - 1) % 12 == 0)
            {
               this.§_-QI§ = this.§_-M5§;
               this.§_-U1§ = this.§_-KF§;
            }
            else
            {
               this.§_-QI§ = this.§_-M5§;
               this.§_-U1§ = this.§_-U1§ + this.§_-8K§;
            }
         }
         _loc13_.x = this.§_-QI§;
         _loc13_.y = this.§_-U1§;
         this.§_-Ab§.addChild(new MenuEncyclopediaPolaroidTower(this.game,this,param1,_loc13_,this.§_-1K§,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12));
         this.§_-QI§ = this.§_-QI§ + this.§_-6A§;
         this.§_-1K§++;
      }
      
      protected function loadItems() : void
      {
         if(this.contains(this.§_-FY§))
         {
            this.removeChild(this.§_-FY§);
         }
         if(this.contains(this.itemsEnemies))
         {
            this.removeChild(this.itemsEnemies);
         }
         if(this.contains(this.§_-Ab§))
         {
            this.removeChild(this.§_-Ab§);
         }
         switch(this.currentLabel)
         {
            case "menu":
               this.loadButtons();
               break;
            case "enemies":
               if(!this.enemiesLoaded)
               {
                  this.loadEnemies();
               }
               this.addChild(this.itemsEnemies);
               MenuEncyclopediaPolaroidEnemy(this.itemsEnemies.getChildAt(0)).§_-7k§(false);
               this.butBack.visible = true;
               this.§_-1c§.visible = false;
               this.§ use§.visible = false;
               break;
            case "towers":
               if(!this.towerLoaded)
               {
                  this.loadTowers();
               }
               this.§_-8s§ = 0;
               this.addChild(this.§_-Ab§);
               MenuEncyclopediaPolaroidTower(this.§_-Ab§.getChildAt(0)).§_-7k§(false);
               this.butBack.visible = true;
               this.§_-1c§.visible = false;
               this.§ use§.visible = false;
               break;
            case "hints":
               this.loadTips();
               this.butBack.visible = true;
               this.§_-1c§.visible = true;
               this.§ use§.visible = true;
         }
      }
      
      protected function §_-K-§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.gotoAndStop("towers");
         this.loadItems();
      }
      
      protected function §_-O9§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.§_-m§.buttonMode = true;
         this.§_-m§.mouseChildren = false;
         this.§_-m§.useHandCursor = true;
         this.§_-m§.gotoAndStop("over");
      }
      
      protected function §_-40§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-m§.useHandCursor = false;
         this.§_-m§.gotoAndStop("idle");
      }
      
      protected function §_-TU§(param1:MouseEvent) : void
      {
         this.§_-m§.gotoAndStop("press");
      }
      
      protected function §_-Pf§(param1:MouseEvent) : void
      {
         this.§_-m§.gotoAndStop("idle");
      }
      
      protected function clickEnemies(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.gotoAndStop("enemies");
         this.§_-4j§.addEventListener(MouseEvent.ROLL_OVER,this.§_-GK§,false,0,true);
         this.§_-4j§.addEventListener(MouseEvent.ROLL_OUT,this.§_-0a§,false,0,true);
         this.ico_enemy_attack.addEventListener(MouseEvent.ROLL_OVER,this.§_-PO§,false,0,true);
         this.ico_enemy_attack.addEventListener(MouseEvent.ROLL_OUT,this.§_-P0§,false,0,true);
         this.§_-Sl§.addEventListener(MouseEvent.ROLL_OVER,this.§_-QM§,false,0,true);
         this.§_-Sl§.addEventListener(MouseEvent.ROLL_OUT,this.§_-NL§,false,0,true);
         this.§_-HL§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Qg§,false,0,true);
         this.§_-HL§.addEventListener(MouseEvent.ROLL_OUT,this.§_-MN§,false,0,true);
         this.§_-Ks§.addEventListener(MouseEvent.ROLL_OVER,this.§_-80§,false,0,true);
         this.§_-Ks§.addEventListener(MouseEvent.ROLL_OUT,this.§_-Al§,false,0,true);
         this.§_-9e§.addEventListener(MouseEvent.ROLL_OVER,this.§_-0k§,false,0,true);
         this.§_-9e§.addEventListener(MouseEvent.ROLL_OUT,this.§_-KG§,false,0,true);
         this.loadItems();
      }
      
      protected function §_-GK§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_HEALTH_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_HEALTH_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-0a§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-PO§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ATTACK_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ATTACK_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-P0§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-QM§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ARMOR_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ARMOR_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-NL§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-Qg§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ARMOR_MAGIC_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_ARMOR_MAGIC_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-MN§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-80§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_SPEED_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_SPEED_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-Al§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-0k§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_COST_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_ENEMY_COST_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-KG§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      public function §_-3c§() : void
      {
         this.§_-71§.ico_attacks.addEventListener(MouseEvent.ROLL_OVER,this.§_-I§,false,0,true);
         this.§_-71§.ico_attacks.addEventListener(MouseEvent.ROLL_OUT,this.§_-3L§,false,0,true);
         this.§_-71§.ico_tower_reload.addEventListener(MouseEvent.ROLL_OVER,this.rollOverTowerReload,false,0,true);
         this.§_-71§.ico_tower_reload.addEventListener(MouseEvent.ROLL_OUT,this.rollOutTowerReload,false,0,true);
         this.§_-71§.ico_tower_range.addEventListener(MouseEvent.ROLL_OVER,this.§_-I6§,false,0,true);
         this.§_-71§.ico_tower_range.addEventListener(MouseEvent.ROLL_OUT,this.§_-MQ§,false,0,true);
      }
      
      public function §_-Re§() : void
      {
         if(this.§_-71§.ico_attacks != null && this.§_-71§.ico_attacks.hasEventListener(MouseEvent.ROLL_OVER))
         {
            this.§_-71§.ico_attacks.removeEventListener(MouseEvent.ROLL_OVER,this.§_-I§);
            this.§_-71§.ico_attacks.removeEventListener(MouseEvent.ROLL_OUT,this.§_-3L§);
            this.§_-71§.ico_tower_reload.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverTowerReload);
            this.§_-71§.ico_tower_reload.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutTowerReload);
            this.§_-71§.ico_tower_range.removeEventListener(MouseEvent.ROLL_OVER,this.§_-I6§);
            this.§_-71§.ico_tower_range.removeEventListener(MouseEvent.ROLL_OUT,this.§_-MQ§);
         }
      }
      
      public function §_-R9§() : void
      {
         this.§_-71§.ico_tower_soldier_health.addEventListener(MouseEvent.ROLL_OVER,this.§_-Eb§,false,0,true);
         this.§_-71§.ico_tower_soldier_health.addEventListener(MouseEvent.ROLL_OUT,this.§_-B5§,false,0,true);
         this.§_-71§.ico_tower_soldier_attack.addEventListener(MouseEvent.ROLL_OVER,this.§_-QA§,false,0,true);
         this.§_-71§.ico_tower_soldier_attack.addEventListener(MouseEvent.ROLL_OUT,this.§_-9N§,false,0,true);
         this.§_-71§.ico_tower_soldier_armor.addEventListener(MouseEvent.ROLL_OVER,this.§_-Fk§,false,0,true);
         this.§_-71§.ico_tower_soldier_armor.addEventListener(MouseEvent.ROLL_OUT,this.§_-Tr§,false,0,true);
         this.§_-71§.ico_tower_soldier_respawn.addEventListener(MouseEvent.ROLL_OVER,this.§_-BD§,false,0,true);
         this.§_-71§.ico_tower_soldier_respawn.addEventListener(MouseEvent.ROLL_OUT,this.§_-Bf§,false,0,true);
      }
      
      public function §_-2g§() : void
      {
         if(this.§_-71§.ico_tower_soldier_health != null && this.§_-71§.ico_tower_soldier_health.hasEventListener(MouseEvent.ROLL_OVER))
         {
            this.§_-71§.ico_tower_soldier_health.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Eb§);
            this.§_-71§.ico_tower_soldier_health.removeEventListener(MouseEvent.ROLL_OUT,this.§_-B5§);
            this.§_-71§.ico_tower_soldier_attack.removeEventListener(MouseEvent.ROLL_OVER,this.§_-QA§);
            this.§_-71§.ico_tower_soldier_attack.removeEventListener(MouseEvent.ROLL_OUT,this.§_-9N§);
            this.§_-71§.ico_tower_soldier_armor.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Fk§);
            this.§_-71§.ico_tower_soldier_armor.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Tr§);
            this.§_-71§.ico_tower_soldier_respawn.removeEventListener(MouseEvent.ROLL_OVER,this.§_-BD§);
            this.§_-71§.ico_tower_soldier_respawn.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Bf§);
         }
      }
      
      protected function §_-I§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_ATTACK_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_ATTACK_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-3L§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function rollOverTowerReload(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_RELOAD_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_RELOAD_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function rollOutTowerReload(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-I6§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_RANGE_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_RANGE_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-MQ§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-Eb§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_HEALTH_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_HEALTH_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-B5§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-QA§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_ATTACK_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_ATTACK_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-9N§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-Fk§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_ARMOR_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_ARMOR_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-Tr§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      protected function §_-BD§(param1:MouseEvent) : void
      {
         this.showTooltip(Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_RESPAWN_NAME",Locale.getDefaultLang()),Locale.loadStringEx("ENCYCLOPEDIA_TOWER_SOLDIER_RESPAWN_DESCRIPTION",Locale.getDefaultLang()));
      }
      
      protected function §_-Bf§(param1:MouseEvent) : void
      {
         this.hideTooltip();
      }
      
      public function showTooltip(param1:String, param2:String) : void
      {
         this.tooltip.loadTooltip(new Point(this.mouseX + 5,this.mouseY - 5),new Point(this.mouseX - 5,this.mouseY - 5),230,{
            "title":param1,
            "text":param2,
            "width":150
         });
         this.addChild(this.tooltip);
      }
      
      public function hideTooltip() : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.hideTooltip();
         }
      }
      
      public function moveTooltip(param1:int) : void
      {
         if(this.tooltip != null)
         {
            this.tooltip.x = this.mouseX + 12 * param1;
            this.tooltip.y = this.mouseY - 8;
         }
      }
      
      protected function rollOverEnemies(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.buttonEnemies.buttonMode = true;
         this.buttonEnemies.mouseChildren = false;
         this.buttonEnemies.useHandCursor = true;
         this.buttonEnemies.gotoAndStop("over");
      }
      
      protected function rollOutEnemies(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.buttonEnemies.useHandCursor = false;
         this.buttonEnemies.gotoAndStop("idle");
      }
      
      protected function mouseDownEnemies(param1:MouseEvent) : void
      {
         this.buttonEnemies.gotoAndStop("press");
      }
      
      protected function mouseUpEnemies(param1:MouseEvent) : void
      {
         this.buttonEnemies.gotoAndStop("idle");
      }
      
      protected function §_-7o§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.gotoAndStop("hints");
         this.loadItems();
      }
      
      protected function §_-C1§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.§_-EU§.buttonMode = true;
         this.§_-EU§.mouseChildren = false;
         this.§_-EU§.useHandCursor = true;
         this.§_-EU§.gotoAndStop("over");
      }
      
      protected function §_-Nz§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-EU§.useHandCursor = false;
         this.§_-EU§.gotoAndStop("idle");
      }
      
      protected function §_-Ae§(param1:MouseEvent) : void
      {
         this.§_-EU§.gotoAndStop("press");
      }
      
      protected function §_-7X§(param1:MouseEvent) : void
      {
         this.§_-EU§.gotoAndStop("idle");
      }
      
      protected function §_-GM§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         var _loc3_:URLRequest = new URLRequest("http://www.kingdomrush.com/strategy.php");
         trace(_loc3_,"_blank");
      }
      
      protected function § get§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.§ try§.buttonMode = true;
         this.§ try§.mouseChildren = false;
         this.§ try§.useHandCursor = true;
         this.§ try§.gotoAndStop("over");
      }
      
      protected function §_-Lj§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.§ try§.useHandCursor = false;
         this.§ try§.gotoAndStop("idle");
      }
      
      protected function §_-Qb§(param1:MouseEvent) : void
      {
         this.§ try§.gotoAndStop("press");
      }
      
      protected function §_-3I§(param1:MouseEvent) : void
      {
         this.§ try§.gotoAndStop("idle");
      }
      
      protected function §_-Ou§(param1:MouseEvent) : void
      {
         if(!this.§_-53§)
         {
            return;
         }
         this.game.gameSounds.playGUINotificationOver2();
         this.§_-T9§(this.§_-DB§ + 1);
      }
      
      protected function §_-Jw§(param1:MouseEvent) : void
      {
         if(!this.§_-53§)
         {
            return;
         }
         this.game.gameSounds.playGUIMouseOverCommon();
         this.§_-1c§.buttonMode = true;
         this.§_-1c§.mouseChildren = false;
         this.§_-1c§.useHandCursor = true;
         this.§_-1c§.gotoAndStop("over");
      }
      
      protected function §_-Oj§(param1:MouseEvent) : void
      {
         if(!this.§_-53§)
         {
            return;
         }
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-1c§.useHandCursor = false;
         this.§_-1c§.gotoAndStop("idle");
      }
      
      protected function §_-BV§(param1:MouseEvent) : void
      {
         if(!this.§_-53§)
         {
            return;
         }
         this.§_-1c§.gotoAndStop("press");
      }
      
      protected function §in§(param1:MouseEvent) : void
      {
         if(!this.§_-53§)
         {
            return;
         }
         this.§_-1c§.gotoAndStop("idle");
      }
      
      protected function §_-29§(param1:MouseEvent) : void
      {
         if(!this.§_-Lc§)
         {
            return;
         }
         this.game.gameSounds.playGUINotificationOver2();
         this.§_-T9§(this.§_-DB§ - 1);
      }
      
      protected function §_-Kr§(param1:MouseEvent) : void
      {
         if(!this.§_-Lc§)
         {
            return;
         }
         this.game.gameSounds.playGUIMouseOverCommon();
         this.§ use§.buttonMode = true;
         this.§ use§.mouseChildren = false;
         this.§ use§.useHandCursor = true;
         this.§ use§.gotoAndStop("over");
      }
      
      protected function §_-7g§(param1:MouseEvent) : void
      {
         if(!this.§_-Lc§)
         {
            return;
         }
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.§ use§.useHandCursor = false;
         this.§ use§.gotoAndStop("idle");
      }
      
      protected function §_-8R§(param1:MouseEvent) : void
      {
         if(!this.§_-Lc§)
         {
            return;
         }
         this.§ use§.gotoAndStop("press");
      }
      
      protected function §_-2T§(param1:MouseEvent) : void
      {
         if(!this.§_-Lc§)
         {
            return;
         }
         this.§ use§.gotoAndStop("idle");
      }
      
      protected function §_-QO§(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIButtonCommon();
         this.gotoAndPlay("menu");
         this.loadItems();
      }
      
      protected function §else §(param1:MouseEvent) : void
      {
         this.game.gameSounds.playGUIMouseOverCommon();
         this.butBack.buttonMode = true;
         this.butBack.mouseChildren = false;
         this.butBack.useHandCursor = true;
         this.butBack.gotoAndStop("over");
      }
      
      protected function §_-CE§(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.butBack.useHandCursor = false;
         this.butBack.gotoAndStop("idle");
      }
      
      protected function §_-Ox§(param1:MouseEvent) : void
      {
         this.butBack.gotoAndStop("press");
      }
      
      protected function §_-JT§(param1:MouseEvent) : void
      {
         this.butBack.gotoAndStop("idle");
      }
      
      protected function close(param1:MouseEvent) : void
      {
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.game.gameSounds.playGUIButtonCommon();
         if(!this.inGame)
         {
            this.game.map.§_-Gg§();
         }
         else
         {
            Level(this.parent).pause(true);
         }
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
      
      protected function emptyEnemies() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.itemsEnemies.numChildren)
         {
            _loc1_[this.itemsEnemies.getChildAt(_loc2_)] = this.itemsEnemies.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.destroyThis();
         }
         _loc1_ = null;
      }
      
      protected function emptyTowers() : void
      {
         var _loc3_:MovieClip = null;
         var _loc1_:Dictionary = new Dictionary(true);
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-Ab§.numChildren)
         {
            _loc1_[this.§_-Ab§.getChildAt(_loc2_)] = this.§_-Ab§.getChildAt(_loc2_);
            _loc2_++;
         }
         for each(_loc3_ in _loc1_)
         {
            _loc3_.destroyThis();
         }
         _loc1_ = null;
      }
      
      protected function destroyThis() : void
      {
         if(!this.inGame)
         {
            this.game.map.itemsLocked = false;
         }
         if(this.tooltip != null)
         {
            this.tooltip.destroyThis();
         }
         this.tooltip = null;
         this.§_-TW§.destroyThis();
         this.§_-TW§ = null;
         this.§_-P8§ = null;
         this.ytweenOut.removeEventListener(TweenEvent.MOTION_FINISH,this.hideFinish);
         this.ytweenOut = null;
         this.emptyEnemies();
         if(this.contains(this.itemsEnemies))
         {
            this.removeChild(this.itemsEnemies);
         }
         this.itemsEnemies = null;
         this.emptyTowers();
         if(this.contains(this.§_-Ab§))
         {
            this.removeChild(this.§_-Ab§);
         }
         this.§_-Ab§ = null;
         this.§_-m§.removeEventListener(MouseEvent.CLICK,this.§_-K-§);
         this.§_-m§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-O9§);
         this.§_-m§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-40§);
         this.§_-m§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-TU§);
         this.§_-m§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Pf§);
         this.buttonEnemies.removeEventListener(MouseEvent.CLICK,this.clickEnemies);
         this.buttonEnemies.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEnemies);
         this.buttonEnemies.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEnemies);
         this.buttonEnemies.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDownEnemies);
         this.buttonEnemies.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUpEnemies);
         this.§_-EU§.removeEventListener(MouseEvent.CLICK,this.§_-7o§);
         this.§_-EU§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-C1§);
         this.§_-EU§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Nz§);
         this.§_-EU§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ae§);
         this.§_-EU§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-7X§);
         this.§ try§.removeEventListener(MouseEvent.CLICK,this.§_-GM§);
         this.§ try§.removeEventListener(MouseEvent.ROLL_OVER,this.§ get§);
         this.§ try§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Lj§);
         this.§ try§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Qb§);
         this.§ try§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-3I§);
         this.§_-FY§.removeChild(this.§_-m§);
         this.§_-FY§.removeChild(this.buttonEnemies);
         this.§_-FY§.removeChild(this.§_-EU§);
         this.§_-FY§.removeChild(this.§ try§);
         if(this.contains(this.§_-FY§))
         {
            this.removeChild(this.§_-FY§);
         }
         this.butBack.removeEventListener(MouseEvent.CLICK,this.§_-QO§);
         this.butBack.removeEventListener(MouseEvent.ROLL_OVER,this.§else §);
         this.butBack.removeEventListener(MouseEvent.ROLL_OUT,this.§_-CE§);
         this.butBack.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Ox§);
         this.butBack.removeEventListener(MouseEvent.MOUSE_UP,this.§_-JT§);
         this.removeChild(this.butBack);
         this.§_-1c§.removeEventListener(MouseEvent.CLICK,this.§_-Ou§);
         this.§_-1c§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Jw§);
         this.§_-1c§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-Oj§);
         this.§_-1c§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-BV§);
         this.§_-1c§.removeEventListener(MouseEvent.MOUSE_UP,this.§in§);
         this.removeChild(this.§_-1c§);
         this.§ use§.removeEventListener(MouseEvent.CLICK,this.§_-29§);
         this.§ use§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Kr§);
         this.§ use§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-7g§);
         this.§ use§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-8R§);
         this.§ use§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-2T§);
         this.removeChild(this.§ use§);
         this.butClose.removeEventListener(MouseEvent.CLICK,this.close);
         this.butClose.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Sv§);
         this.butClose.removeEventListener(MouseEvent.ROLL_OUT,this.§_-A-§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Py§);
         this.butClose.removeEventListener(MouseEvent.MOUSE_UP,this.§_-Rs§);
         this.removeChild(this.butClose);
         this.game = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
