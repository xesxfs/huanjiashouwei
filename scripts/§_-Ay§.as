package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-Ay§ extends MovieClip
   {
      
      public static const §_-1T§:int = 1;
      
      public static const §_-Me§:int = 2;
      
      public static const §_-TB§:int = 3;
       
      
      public var icon:MovieClip;
      
      public var §_-SK§:TextField;
      
      public var status:int;
      
      public var §_-4b§:Boolean;
      
      public var §_-5K§:String;
      
      public var stars:int;
      
      public var index:int;
      
      protected var menuUpgrades:MenuUpgrades;
      
      protected var game:Game;
      
      protected var §_-SV§:Boolean;
      
      public function §_-Ay§(param1:MenuUpgrades, param2:Game, param3:int, param4:Point, param5:String, param6:int, param7:Boolean, param8:Boolean)
      {
         super();
         this.menuUpgrades = param1;
         this.game = param2;
         this.index = param3;
         this.x = param4.x;
         this.y = param4.y;
         this.stars = param6;
         this.§_-SV§ = param7;
         this.§_-4b§ = param8;
         this.§_-5K§ = param5;
         this.§_-SK§.text = this.stars.toString();
         this.icon.gotoAndStop(param5);
         this.initCheckStatus();
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown,false,0,true);
         this.addEventListener(MouseEvent.MOUSE_UP,this.mouseUp,false,0,true);
      }
      
      public function §_-TR§() : void
      {
         this.status = §_-1T§;
         this.§_-4b§ = false;
      }
      
      public function §_-09§() : void
      {
         if(this.index != 0 && this.index % 5 != 0)
         {
            this.§_-SV§ = §_-Ay§(this.menuUpgrades.§_-H5§.getChildAt(this.index - 1)).§_-4b§;
         }
         this.initCheckStatus();
      }
      
      protected function initCheckStatus() : void
      {
         if(this.§_-4b§)
         {
            this.bought();
         }
         else if(this.game.stars >= this.stars && this.§_-SV§)
         {
            this.§_-NP§();
         }
         else
         {
            this.§_-43§();
         }
      }
      
      protected function bought() : void
      {
         this.gotoAndStop("bought");
         this.menuUpgrades.hideTooltip();
         this.§_-SK§.visible = false;
         this.status = §_-Me§;
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this.click);
         }
      }
      
      protected function §_-NP§() : void
      {
         this.gotoAndStop("available");
         this.status = §_-1T§;
         this.§_-SK§.text = this.stars.toString();
         this.§_-SK§.visible = true;
         this.§_-SK§.textColor = 16770560;
         if(!this.hasEventListener(MouseEvent.CLICK))
         {
            this.addEventListener(MouseEvent.CLICK,this.click,false,0,true);
         }
      }
      
      protected function §_-43§() : void
      {
         this.gotoAndStop("locked");
         this.status = §_-TB§;
         this.§_-SK§.text = this.stars.toString();
         this.§_-SK§.visible = true;
         this.§_-SK§.textColor = 13421772;
         if(this.hasEventListener(MouseEvent.CLICK))
         {
            this.removeEventListener(MouseEvent.CLICK,this.click);
         }
      }
      
      protected function click(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopSound("gui_buy_upgrade");
         this.game.gameSounds.playGUIBuyUpgrade();
         this.§_-4b§ = true;
         this.§_-SK§.visible = false;
         this.menuUpgrades.buyItem(this);
         this.menuUpgrades.addChild(new MenuUpgradeItemBuyAnim(new Point(this.x,this.y)));
      }
      
      protected function rollOver(param1:MouseEvent) : void
      {
         this.game.gameSounds.§_-Dh§();
         this.menuUpgrades.showTooltip(this.§_-5K§,this.stars);
         if(this.status != §_-1T§)
         {
            return;
         }
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.gotoAndStop("over");
      }
      
      protected function rollOut(param1:MouseEvent) : void
      {
         this.game.gameSounds.stopGUIMouseOverCommon();
         this.menuUpgrades.hideTooltip();
         if(this.status != §_-1T§)
         {
            return;
         }
         this.useHandCursor = false;
         this.gotoAndStop("available");
      }
      
      protected function mouseDown(param1:MouseEvent) : void
      {
         if(this.status != §_-1T§)
         {
            return;
         }
         this.gotoAndStop("press");
      }
      
      protected function mouseUp(param1:MouseEvent) : void
      {
         if(this.status != §_-1T§)
         {
            return;
         }
         this.gotoAndStop("over");
      }
      
      public function destroyThis() : void
      {
         this.game = null;
         this.menuUpgrades = null;
         this.removeEventListener(MouseEvent.CLICK,this.click);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOut);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.mouseDown);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.mouseUp);
         this.parent.removeChild(this);
      }
   }
}
