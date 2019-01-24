package
{
   import fl.transitions.Tween;
   import fl.transitions.easing.Strong;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class MenuBottom extends MovieClip
   {
       
      
      public var §_-p§:MovieClip;
      
      public var powersHolder:Sprite;
      
      private var infoHolder:Sprite;
      
      private var infoHolderHiding:Sprite;
      
      private var §_-44§:Tween;
      
      private var §_-0X§:Boolean;
      
      public var level:Level;
      
      public function MenuBottom(param1:Point, param2:Level)
      {
         this.powersHolder = new Sprite();
         this.infoHolder = new Sprite();
         this.infoHolderHiding = new Sprite();
         super();
         this.x = param1.x;
         this.y = param1.y;
         this.level = param2;
         this.§_-Ej§();
         this.addChild(this.powersHolder);
         if(!this.level.game.pc || !this.level.game.pcLightning)
         {
            this.powersHolder.addChild(new PowerFireball(this.level,new Point(75,18),false));
            this.powersHolder.addChild(new PowerReinforcement(this.level,new Point(140,18),false));
         }
         else
         {
            this.powersHolder.addChild(new PowerFireball(this.level,new Point(50,18),false));
            this.powersHolder.addChild(new PowerReinforcement(this.level,new Point(107,18),false));
            this.powersHolder.addChild(new PowerLightning(this.level,new Point(165,18),false));
         }
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,650,this.y,0.7,true);
         this.addChild(this.infoHolderHiding);
         this.addChild(this.infoHolder);
      }
      
      public function goOut() : void
      {
         this.§_-44§ = new Tween(this,"y",Strong.easeOut,this.y,650,0.7,true);
      }
      
      public function §_-Id§() : void
      {
         this.§_-0X§ = true;
         this.§_-p§.gotoAndStop("ready");
         this.§_-p§.addEventListener(MouseEvent.CLICK,this.§_-P6§,false,0,true);
         this.§_-p§.buttonMode = true;
         this.§_-p§.mouseChildren = false;
         this.§_-p§.useHandCursor = true;
         this.§_-p§.addEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§,false,0,true);
         this.§_-p§.addEventListener(MouseEvent.ROLL_OUT,this.§_-7K§,false,0,true);
         this.§_-p§.addEventListener(MouseEvent.MOUSE_DOWN,this.§_-Sg§,false,0,true);
         this.§_-p§.addEventListener(MouseEvent.MOUSE_UP,this.§_-CH§,false,0,true);
      }
      
      public function §_-Ej§() : void
      {
         this.§_-0X§ = false;
         this.§_-p§.gotoAndStop("disabled");
         this.§_-p§.removeEventListener(MouseEvent.CLICK,this.§_-P6§);
         this.§_-p§.useHandCursor = false;
         this.§_-p§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§);
         this.§_-p§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-7K§);
         this.§_-p§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Sg§);
         this.§_-p§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-CH§);
      }
      
      protected function §_-Tn§(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.playGUIMouseOverCommon();
         this.§_-p§.gotoAndStop("over");
      }
      
      protected function §_-7K§(param1:MouseEvent) : void
      {
         this.level.game.gameSounds.stopGUIMouseOverCommon();
         this.§_-p§.gotoAndStop("ready");
      }
      
      protected function §_-Sg§(param1:MouseEvent) : void
      {
         this.§_-p§.gotoAndStop("press");
      }
      
      protected function §_-CH§(param1:MouseEvent) : void
      {
         this.§_-p§.gotoAndStop("ready");
      }
      
      protected function §_-P6§(param1:MouseEvent) : void
      {
         this.level.§_-P6§(new Point(659,531));
         this.§_-Ej§();
      }
      
      public function updateMenu() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.powersHolder.numChildren)
         {
            §_-5g§(this.powersHolder.getChildAt(_loc1_)).onFrameUpdate();
            _loc1_++;
         }
         if(this.infoHolder.numChildren == 1)
         {
            MovieClip(this.infoHolder.getChildAt(0)).onFrameUpdate();
         }
      }
      
      public function showTowerInfo(param1:Tower) : void
      {
         if(!this.§_-8Z§("tower"))
         {
            this.infoHolder.addChild(new MenuBottomTowerInfo(new Point(202,20),param1));
         }
         else
         {
            MenuBottomTowerInfo(this.infoHolder.getChildAt(0)).§_-6o§(param1);
         }
      }
      
      public function showTowerBarracksInfo(param1:Tower) : void
      {
         if(!this.§_-8Z§("barrack"))
         {
            this.infoHolder.addChild(new MenuBottomTowerBarracksInfo(new Point(202,20),param1));
         }
         else
         {
            MenuBottomTowerBarracksInfo(this.infoHolder.getChildAt(0)).§_-6o§(param1);
         }
      }
      
      public function showEnemyInfo(param1:Enemy) : void
      {
         if(!this.§_-8Z§("enemy"))
         {
            this.infoHolder.addChild(new MenuBottomEnemyInfo(new Point(202,20),param1));
         }
         else
         {
            MenuBottomEnemyInfo(this.infoHolder.getChildAt(0)).swapEnemy(param1);
         }
      }
      
      public function showSoldierInfo(param1:Soldier) : void
      {
         if(!this.§_-8Z§("soldier"))
         {
            this.infoHolder.addChild(new MenuBottomSoldierInfo(new Point(202,20),param1));
         }
         else
         {
            MenuBottomSoldierInfo(this.infoHolder.getChildAt(0)).§_-B9§(param1);
         }
      }
      
      public function §_-8F§(param1:§_-5g§) : void
      {
         if(!this.§_-8Z§("power"))
         {
            this.infoHolder.addChild(new MenuBottomPowerInfo(new Point(205,1),param1));
         }
         else
         {
            MenuBottomPowerInfo(this.infoHolder.getChildAt(0)).§_-JN§(param1);
         }
      }
      
      public function §_-8Z§(param1:String) : Boolean
      {
         if(this.infoHolder.numChildren == 1)
         {
            if(MovieClip(this.infoHolder.getChildAt(0)).getType() != param1)
            {
               MovieClip(this.infoHolder.getChildAt(0)).destroyThis();
               return false;
            }
            return true;
         }
         return false;
      }
      
      public function forceHideInfo() : void
      {
         if(this.infoHolder.numChildren == 1)
         {
            MovieClip(this.infoHolder.getChildAt(0)).hide();
         }
      }
      
      public function §_-3v§(param1:int) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < this.powersHolder.numChildren)
         {
            §_-5g§(this.powersHolder.getChildAt(_loc2_)).§_-Se§(param1);
            _loc2_++;
         }
      }
      
      public function unlockPower(param1:int) : void
      {
         §_-5g§(this.powersHolder.getChildAt(param1)).unlock();
      }
      
      public function §_-Qd§(param1:MovieClip) : void
      {
         if(this.infoHolder.contains(param1))
         {
            this.infoHolder.removeChild(param1);
            this.infoHolderHiding.addChild(param1);
         }
      }
      
      public function destroyThis() : void
      {
         if(this.§_-0X§)
         {
            this.§_-p§.removeEventListener(MouseEvent.CLICK,this.§_-P6§);
            this.§_-p§.removeEventListener(MouseEvent.ROLL_OVER,this.§_-Tn§);
            this.§_-p§.removeEventListener(MouseEvent.ROLL_OUT,this.§_-7K§);
            this.§_-p§.removeEventListener(MouseEvent.MOUSE_DOWN,this.§_-Sg§);
            this.§_-p§.removeEventListener(MouseEvent.MOUSE_UP,this.§_-CH§);
         }
         this.infoHolderHiding = null;
         this.infoHolder = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
