package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MenuBottomTowerBarracksInfo extends MovieClip
   {
       
      
      public var info_name:TextField;
      
      public var portrait_soldier:MovieClip;
      
      public var portrait:MovieClip;
      
      public var info_health:TextField;
      
      public var shield:MovieClip;
      
      public var info_respawn:TextField;
      
      public var info_armor:TextField;
      
      public var info_damage:TextField;
      
      private var type:String;
      
      private var §_-Da§:Tower;
      
      private var §_-AM§:Boolean;
      
      private var §_-44§:Tween;
      
      private var §_-0h§:Tween;
      
      public function MenuBottomTowerBarracksInfo(param1:Point, param2:Tower)
      {
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Da§ = param2;
         this.type = "barrack";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         if(MenuBottom(this.parent.parent).level.game.main.tooltipsStatus)
         {
            this.addChild(new MenuBottomTooltip(new Point(195,8),new Point(415,552),9,50,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(253,8),new Point(469,552),1,46,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(310,8),new Point(530,552),5,46,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(363,8),new Point(585,552),6,35,MenuBottom(this.parent.parent).level));
         }
         this.updateData();
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function §_-6o§(param1:Tower) : void
      {
         this.§_-Da§ = param1;
         this.showTowerInfo();
      }
      
      public function updateData() : void
      {
         this.showTowerInfo();
      }
      
      public function showTowerInfo() : void
      {
         var _loc1_:Object = this.§_-Da§.getInfo();
         MovieClip(this.portrait).gotoAndStop("p_tower_" + _loc1_.tIconName);
         MovieClip(this.portrait_soldier).gotoAndStop("p_soldier_" + _loc1_.tSoldierName);
         this.info_name.text = _loc1_.tName;
         this.info_health.text = _loc1_.tHealth;
         this.info_damage.text = _loc1_.tDamageMin + "-" + _loc1_.tDamageMax;
         this.info_armor.text = this.§_-Da§.cRoot.gameSettings.getArmorString(Number(_loc1_.tArmor));
         if(_loc1_.tRespawn != "-")
         {
            this.info_respawn.text = _loc1_.tRespawn / MenuBottom(this.parent.parent).level.gameSettings.framesRate + "s";
         }
         else
         {
            this.info_respawn.text = _loc1_.tRespawn;
         }
      }
      
      public function hide() : void
      {
         if(this.§_-AM§)
         {
            return;
         }
         this.§_-AM§ = true;
         MenuBottom(this.parent.parent).§_-Qd§(this);
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
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
