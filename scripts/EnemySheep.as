package
{
   import fl.lang.Locale;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class EnemySheep extends EnemyCommon
   {
       
      
      public var §_-0B§:int = 0;
      
      public var lifebarPosition:Point;
      
      public function EnemySheep(param1:int, param2:Array, param3:Number, param4:Number, param5:int, param6:int, param7:int, param8:int, param9:int, param10:Number)
      {
         super(param1,param2);
         this.initHealth = param7;
         this.health = param6;
         this.gold = param8;
         this.cost = param9;
         this.speed = param10;
         this.x = param3;
         this.y = param4;
         this.currentNode = param5;
      }
      
      override public function init(param1:Event) : void
      {
         this.cRoot = Level(this.parent.parent);
         this.cRoot.game.gameSounds.playSorcererSheep();
         this.isActive = true;
         this.canBeBlocked = false;
         this.§_-0f§ = false;
         this.level = 1;
         this.armor = 0;
         this.dodge = 0;
         if(this.speed >= 3)
         {
            this.speed = 3;
         }
         this.nodeMarginError = this.speed + 0.1;
         this.§_-Jc§ = new §_-H8§(this.lifebarPosition,this.health,this.initHealth);
         this.addChild(§_-Jc§);
         this.§_-R2§ = "";
         this.getFacing();
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      override public function getOtherInfo(param1:Object) : void
      {
         param1.tIconName = "sheep";
         param1.eName = Locale.loadStringEx("ENEMY_SHEEP_NAME",Locale.getDefaultLang());
      }
      
      override public function clickEvents(param1:MouseEvent) : void
      {
         this.cRoot.freeMenues();
         this.cRoot.enemySelection.setEnemy(this);
         this.cRoot.menu.showEnemyInfo(this);
         this.§_-0B§++;
         if(this.§_-0B§ == 8)
         {
            this.cRoot.game.gameAchievement.killSheep(this.cRoot);
            this.isActive = false;
            this.isDead = true;
            this.health = 0;
            this.§_-Jc§.updateProgress(0);
            this.§_-Jc§.hide();
            this.cRoot.removeEnemy(this);
         }
      }
      
      override public function destroyThis() : void
      {
         this.§_-BN§(false);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.ROLL_OVER,rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,rollOut);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvents);
         this.removeFromList();
         if(this.contains(this.§_-Jc§))
         {
            this.removeChild(this.§_-Jc§);
         }
         this.§_-Jc§ = null;
         this.fighterPosition = null;
         this.soldier = null;
         this.road = null;
         this.§_-GF§ = null;
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
