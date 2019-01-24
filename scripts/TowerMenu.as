package
{
   import com.adobe.utils.StringUtil;
   import fl.lang.Locale;
   import fl.transitions.Tween;
   import fl.transitions.TweenEvent;
   import fl.transitions.easing.Regular;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class TowerMenu extends MovieClip
   {
       
      
      public var level:Level;
      
      public var cTower:MovieClip;
      
      public var menuItemsHolder:Sprite;
      
      public var sellItem:Boolean;
      
      public var sellValue:int;
      
      public var closeOnExcec:Boolean;
      
      public var damageBackground:String;
      
      public var §_-J2§:int = 32;
      
      public var damageMin:int = 12;
      
      public var speedBackground:String;
      
      public var §_-G2§:int;
      
      public var speedMin:int;
      
      public var specialBackground:String;
      
      private var §_-44§:Tween;
      
      private var §_-P8§:Tween;
      
      public var §_-F8§:Array;
      
      public function TowerMenu(param1:Level)
      {
         this.menuItemsHolder = new Sprite();
         this.§_-F8§ = [];
         super();
         this.level = param1;
         this.§_-F8§.push(new Point(-40,-33));
         this.§_-F8§.push(new Point(40,-33));
         this.§_-F8§.push(new Point(-40,43));
         this.§_-F8§.push(new Point(40,43));
         this.§_-F8§.push(new Point(-50,-4));
         this.§_-F8§.push(new Point(50,-4));
         this.§_-F8§.push(new Point(0,-45));
         this.§_-F8§.push(new Point(0,60));
         this.§_-F8§.push(new Point(40,40));
         this.§_-F8§.push(new Point(-45,-20));
         this.§_-F8§.push(new Point(45,-20));
         this.menuItemsHolder.addChild(new TowerMenuItem(0,-44));
         this.menuItemsHolder.addChild(new TowerMenuItem(46,-17));
         this.menuItemsHolder.addChild(new TowerMenuItem(44,35));
         this.menuItemsHolder.addChild(new TowerMenuItem(-1,58));
         this.menuItemsHolder.addChild(new TowerMenuItem(-1,58));
         this.addChild(this.menuItemsHolder);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.§else§();
      }
      
      public function load(param1:int, param2:int, param3:MovieClip, param4:Boolean, param5:int, param6:Boolean, param7:Array) : void
      {
         var _loc8_:String = null;
         if(this.level.quickMenu.cTower != null)
         {
            this.level.quickMenu.hide();
         }
         this.sellItem = param4;
         this.sellValue = param5;
         this.x = param1;
         this.y = param2 - 15;
         this.cTower = param3;
         this.closeOnExcec = param6;
         var _loc9_:int = 0;
         while(_loc9_ < 5)
         {
            if(_loc9_ < param7.length)
            {
               if(param7[_loc9_].length == 10)
               {
                  _loc8_ = "";
               }
               else
               {
                  _loc8_ = param7[_loc9_][10];
               }
               TowerMenuItem(this.menuItemsHolder.getChildAt(_loc9_)).loadData(param7[_loc9_][0],param7[_loc9_][1],param7[_loc9_][2],param7[_loc9_][3],param7[_loc9_][4],param7[_loc9_][5],param7[_loc9_][6],param7[_loc9_][7],param7[_loc9_][8],param7[_loc9_][9],_loc8_);
               TowerMenuItem(this.menuItemsHolder.getChildAt(_loc9_)).visible = true;
            }
            else
            {
               TowerMenuItem(this.menuItemsHolder.getChildAt(_loc9_)).visible = false;
               TowerMenuItem(this.menuItemsHolder.getChildAt(_loc9_)).disabledCondition = "";
            }
            _loc9_++;
         }
         this.§_-D6§();
      }
      
      public function execAction(param1:String, param2:TowerMenuItem) : void
      {
         if(this.cTower == null)
         {
            return;
         }
         this.cTower.upgradeTower(param1);
         if(!this.closeOnExcec && param1 != "rally")
         {
            param2.tooltipParams = this.cTower.getTooltipParams(param2.action);
         }
         if(this.closeOnExcec || param1 == "sell" || param1 == "rally")
         {
            this.hide();
         }
      }
      
      public function §_-H1§(param1:int, param2:int) : void
      {
      }
      
      public function §else§() : void
      {
      }
      
      public function show(param1:Sprite) : void
      {
         this.level.game.gameSounds.§_-DF§();
         this.scaleX = 1;
         this.scaleY = 1;
         param1.addChild(this);
         this.fadeIn();
      }
      
      public function §_-OX§() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            TowerMenuItem(this.menuItemsHolder.getChildAt(_loc1_)).§_-S3§();
            _loc1_++;
         }
      }
      
      public function hide() : void
      {
         this.level.game.gameSounds.stopSound("gui_open_tower_menu");
         if(this.cTower != null && this.cTower.parent != null)
         {
            this.cTower.unSelect();
         }
         this.cTower = null;
         this.fadeOut();
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            TowerMenuItem(this.menuItemsHolder.getChildAt(_loc1_)).§use§();
            TowerMenuItem(this.menuItemsHolder.getChildAt(_loc1_)).disabledCondition = "";
            _loc1_++;
         }
      }
      
      public function §_-D6§() : void
      {
         var _loc1_:String = null;
         if(this.sellItem)
         {
            _loc1_ = Locale.getDefaultLang();
            TowerMenuItem(this.menuItemsHolder.getChildAt(4)).loadData("sell","tw_sell",0,false,0,0,0,8,"TooltipBasic",{
               "title":Locale.loadStringEx("TOWER_SELL",_loc1_),
               "text":this.createSellDescription(),
               "atts":null
            });
            TowerMenuItem(this.menuItemsHolder.getChildAt(4)).visible = true;
         }
      }
      
      private function createSellDescription() : String
      {
         return StringUtil.replace(Locale.loadStringEx("TOWER_SELL_DESCRIPTION",Locale.getDefaultLang()),"{price}",String(Tower(this.cTower).getSellValue()));
      }
      
      private function fadeIn() : void
      {
         this.§_-44§ = new Tween(this,"scaleX",Regular.easeOut,this.scaleX - 0.6,this.scaleX,4,false);
         this.§_-P8§ = new Tween(this,"scaleY",Regular.easeOut,this.scaleY - 0.6,this.scaleY,4,false);
         this.§_-44§.addEventListener(TweenEvent.MOTION_FINISH,this.onFadeInFinished,false,0,true);
      }
      
      public function onFadeInFinished(param1:TweenEvent) : void
      {
      }
      
      private function fadeOut() : void
      {
         this.§_-44§ = new Tween(this,"scaleX",Regular.easeIn,this.scaleX,this.scaleX - 0.2,1,false);
         this.§_-P8§ = new Tween(this,"scaleY",Regular.easeIn,this.scaleY,this.scaleY - 0.2,1,false);
         this.§_-44§.addEventListener(TweenEvent.MOTION_FINISH,this.onFadeOutFinished,false,0,true);
      }
      
      public function onFadeOutFinished(param1:TweenEvent) : void
      {
         if(this.cTower == null && this.parent != null)
         {
            if(this.parent.contains(this))
            {
               this.parent.removeChild(this);
            }
         }
      }
      
      public function destroyThis() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < 5)
         {
            TowerMenuItem(this.menuItemsHolder.getChildAt(_loc1_)).destroyThis();
            _loc1_++;
         }
         this.level = null;
         this.cTower = null;
         this.removeChild(this.menuItemsHolder);
         this.menuItemsHolder = null;
         if(this.§_-44§ != null)
         {
            this.§_-44§.removeEventListener(TweenEvent.MOTION_FINISH,this.onFadeOutFinished);
            this.§_-44§.removeEventListener(TweenEvent.MOTION_FINISH,this.onFadeInFinished);
         }
         this.§_-44§ = null;
         this.§_-P8§ = null;
         this.§_-F8§ = null;
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
      }
   }
}
