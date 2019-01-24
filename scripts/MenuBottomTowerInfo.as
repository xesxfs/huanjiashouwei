package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MenuBottomTowerInfo extends MovieClip
   {
       
      
      public var info_name:TextField;
      
      public var info_reload:TextField;
      
      public var info_range:TextField;
      
      public var portrait:MovieClip;
      
      public var attack:MovieClip;
      
      public var info_damage:TextField;
      
      private var type:String;
      
      private var §_-Da§:Tower;
      
      private var §_-AM§:Boolean;
      
      private var §_-44§:Tween;
      
      private var §_-0h§:Tween;
      
      public function MenuBottomTowerInfo(param1:Point, param2:Tower)
      {
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.§_-Da§ = param2;
         this.type = "tower";
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         if(MenuBottom(this.parent.parent).level.game.main.tooltipsStatus)
         {
            this.addChild(new MenuBottomTooltip(new Point(175,8),new Point(400,552),1,60,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(251,8),new Point(475,552),2,65,MenuBottom(this.parent.parent).level));
            this.addChild(new MenuBottomTooltip(new Point(345,8),new Point(570,552),3,53,MenuBottom(this.parent.parent).level));
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
         this.info_name.text = _loc1_.tName;
         this.info_damage.text = _loc1_.tDamageMin + "-" + _loc1_.tDamageMax;
         if(_loc1_.tReload != "-")
         {
            this.info_reload.text = this.§_-Da§.cRoot.gameSettings.getReloadString(_loc1_.tReload / MenuBottom(this.parent.parent).level.gameSettings.framesRate);
         }
         else
         {
            this.info_reload.text = "-";
         }
         if(_loc1_.tAttackDamage == null)
         {
            this.attack.gotoAndStop(1);
         }
         else
         {
            this.attack.gotoAndStop(2);
         }
         if(_loc1_.tRangeWidth == "-")
         {
            this.info_range.text = "-";
         }
         else
         {
            this.info_range.text = this.§_-Da§.cRoot.gameSettings.getRangeString(_loc1_.tRangeWidth);
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
         this.§_-Da§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
