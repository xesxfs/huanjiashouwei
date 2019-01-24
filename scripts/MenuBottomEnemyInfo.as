package
{
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MenuBottomEnemyInfo extends MovieClip
   {
       
      
      public var info_name:TextField;
      
      public var info_cost:TextField;
      
      public var portrait:MovieClip;
      
      public var info_health:TextField;
      
      public var shield:MovieClip;
      
      public var info_armor:TextField;
      
      public var info_damage:TextField;
      
      private var enemy:Enemy;
      
      private var type:String;
      
      private var tooltipsHolder:Sprite;
      
      private var §_-AM§:Boolean;
      
      private var §_-44§:Tween;
      
      private var §_-0h§:Tween;
      
      public function MenuBottomEnemyInfo(param1:Point, param2:Enemy)
      {
         this.tooltipsHolder = new Sprite();
         super();
         addFrameScript(0,this.frame1);
         this.x = param1.x;
         this.y = param1.y;
         this.§_-AM§ = false;
         this.enemy = param2;
         this.type = "enemy";
         this.addChild(this.tooltipsHolder);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.§_-E1§();
         this.updateData();
      }
      
      private function §_-E1§() : void
      {
         while(this.tooltipsHolder.numChildren)
         {
            this.tooltipsHolder.removeChildAt(0);
         }
         var _loc1_:Object = this.enemy.getInfo();
         this.tooltipsHolder.addChild(new MenuBottomTooltip(new Point(170,8),new Point(405,552),4,70,MenuBottom(this.parent.parent).level));
         this.tooltipsHolder.addChild(new MenuBottomTooltip(new Point(255,8),new Point(478,552),1,50,MenuBottom(this.parent.parent).level));
         if(_loc1_.eArmor == 0 && _loc1_.eMagicArmor == 0)
         {
            this.addChild(new MenuBottomTooltip(new Point(315,8),new Point(537,552),7,45,MenuBottom(this.parent.parent).level));
         }
         else if(_loc1_.eArmor != 0)
         {
            this.tooltipsHolder.addChild(new MenuBottomTooltip(new Point(315,8),new Point(537,552),7,45,MenuBottom(this.parent.parent).level));
         }
         else
         {
            this.tooltipsHolder.addChild(new MenuBottomTooltip(new Point(315,8),new Point(537,552),10,45,MenuBottom(this.parent.parent).level));
         }
         this.tooltipsHolder.addChild(new MenuBottomTooltip(new Point(368,8),new Point(583,552),8,35,MenuBottom(this.parent.parent).level));
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.§_-AM§)
         {
            this.showEnemyInfo();
         }
      }
      
      public function swapEnemy(param1:Enemy) : void
      {
         this.enemy = param1;
         this.§_-E1§();
         this.showEnemyInfo();
      }
      
      public function updateData() : void
      {
         this.showEnemyInfo();
      }
      
      public function showEnemyInfo() : void
      {
         if(this.enemy == null || this.enemy.isDead)
         {
            this.hide();
            return;
         }
         var _loc1_:Object = this.enemy.getInfo();
         MovieClip(this.portrait).gotoAndStop("p_enemy_" + _loc1_.tIconName);
         this.info_name.text = _loc1_.eName;
         this.info_health.text = _loc1_.eHealth + "/" + _loc1_.eInitHealth;
         this.info_damage.text = _loc1_.eDamageMin + "-" + _loc1_.eDamageMax;
         if(_loc1_.eArmor == 0 && _loc1_.eMagicArmor == 0)
         {
            this.shield.gotoAndStop(1);
            this.info_armor.text = MenuBottom(this.parent.parent).level.gameSettings.getArmorString(_loc1_.eArmor);
         }
         else if(_loc1_.eArmor != 0)
         {
            this.shield.gotoAndStop(1);
            this.info_armor.text = MenuBottom(this.parent.parent).level.gameSettings.getArmorString(_loc1_.eArmor);
         }
         else
         {
            this.shield.gotoAndStop(2);
            this.info_armor.text = MenuBottom(this.parent.parent).level.gameSettings.getArmorString(_loc1_.eMagicArmor);
         }
         this.info_cost.text = _loc1_.eCost;
      }
      
      public function hide() : void
      {
         if(this.§_-AM§)
         {
            return;
         }
         this.§_-AM§ = true;
         MenuBottom(this.parent.parent).§_-Qd§(this);
         MenuBottom(this.parent.parent).level.enemySelection.unSetEnemy();
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
         MenuBottom(this.parent.parent).level.enemySelection.unSetEnemy();
         this.enemy = null;
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
