package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MenuBottomSoldierInfo extends MovieClip
   {
       
      
      public var info_name:TextField;
      
      public var portrait:MovieClip;
      
      public var info_health:TextField;
      
      public var shield:MovieClip;
      
      public var info_respawn:TextField;
      
      public var info_armor:TextField;
      
      public var info_damage:TextField;
      
      private var soldier:Soldier;
      
      private var type:String;
      
      private var §_-AM§:Boolean;
      
      private var §_-44§:Tween;
      
      private var §_-0h§:Tween;
      
      public function MenuBottomSoldierInfo(param1:Point, param2:Soldier)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.soldier = param2;
         this.type = "soldier";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         if(MenuBottom(this.parent.parent).level.game.main.tooltipsStatus)
         {
            this.addChild(new MenuBottomTooltip(new Point(170,8),new Point(405,552),4,70,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(251,8),new Point(470,552),1,48,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(311,8),new Point(533,552),5,44,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(360,8),new Point(580,552),6,43,MenuBottom(this.parent.parent).level));
         }
         this.updateData();
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.§_-AM§)
         {
            this.showSoldierInfo();
         }
      }
      
      public function §_-B9§(param1:Soldier) : void
      {
         this.soldier = param1;
         this.showSoldierInfo();
      }
      
      public function updateData() : void
      {
         this.showSoldierInfo();
      }
      
      public function showSoldierInfo() : void
      {
         if(this.soldier == null || this.soldier.isDead)
         {
            this.hide();
            return;
         }
         var _loc1_:Object = this.soldier.getInfo();
         MovieClip(this.portrait).gotoAndStop("p_soldier_" + _loc1_.sIconName);
         this.info_name.text = _loc1_.sName;
         this.info_health.text = _loc1_.sHealth + "/" + _loc1_.sInitHealth;
         this.info_damage.text = _loc1_.sDamageMin + "-" + _loc1_.sDamageMax;
         this.info_armor.text = MenuBottom(this.parent.parent).level.gameSettings.getArmorString(_loc1_.sArmor);
         this.info_respawn.text = _loc1_.sRespawn;
      }
      
      public function hide() : void
      {
         if(this.§_-AM§)
         {
            return;
         }
         this.§_-AM§ = true;
         MenuBottom(this.parent.parent).§_-Qd§(this);
         MenuBottom(this.parent.parent).level.soldierSelection.§_-G9§();
         this.§_-0h§ = new Tween(this,"y",Strong.easeOut,this.y,56,0.25,true);
         this.§_-0h§.addEventListener(TweenEvent.MOTION_FINISH,this.hideFinish,false,0,true);
      }
      
      public function hideFinish(param1:TweenEvent) : *
      {
         this.destroyThis();
      }
      
      public function getType() : String
      {
         return this.type;
      }
      
      public function destroyThis() : void
      {
         MenuBottom(this.parent.parent).level.soldierSelection.§_-G9§();
         this.soldier = null;
         this.§_-0h§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
