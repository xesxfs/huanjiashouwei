package
{
   import fl.lang.Locale;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import ironhide.utils.tooltip.TooltipBasic;
   
   public class TowerMenuItem extends MovieClip
   {
       
      
      public var §_-GW§:MovieClip;
      
      public var sellItem:Boolean;
      
      public var action:String;
      
      public var §_-2b§:Boolean;
      
      public var isActive:Boolean;
      
      public var §_-Ed§:Boolean;
      
      public var disabledCondition:String;
      
      public var §_-SK§:int;
      
      public var §_-LV§:int;
      
      public var §_-7d§:String = "empty";
      
      public var §_-73§:int;
      
      public var §_-Ci§:int;
      
      public var §_-FT§:int;
      
      public var §_-Ji§:Boolean;
      
      public var §_-Oo§:Array;
      
      public var position:int = 0;
      
      public var tooltipClass:String;
      
      public var tooltipParams:Object;
      
      public var level1:§_-32§;
      
      public var level2:§_-32§;
      
      public var level3:§_-32§;
      
      public var towerMenuPowerBuy:§_-5L§;
      
      public var cRoot:MovieClip;
      
      public function TowerMenuItem(param1:int, param2:int)
      {
         this.§_-Oo§ = [];
         this.towerMenuPowerBuy = new §_-5L§();
         super();
         this.x = param1;
         this.y = param2;
         this.§_-7d§ = "empty";
         this.level1 = new §_-32§();
         this.level1.x = 0;
         this.level1.y = -19;
         this.§_-Oo§.push(this.level1);
         this.addChild(this.level1);
         this.level2 = new §_-32§();
         this.level2.x = 14;
         this.level2.y = -14;
         this.§_-Oo§.push(this.level2);
         this.addChild(this.level2);
         this.level3 = new §_-32§();
         this.level3.x = 19;
         this.level3.y = 0;
         this.§_-Oo§.push(this.level3);
         this.addChild(this.level3);
         this.§_-Ji§ = false;
         this.addChild(this.towerMenuPowerBuy);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents,false,0,true);
      }
      
      private function init(param1:Event) : void
      {
         this.cRoot = MovieClip(this.parent.parent);
         if(this.position != 0)
         {
            this.x = TowerMenu(this.cRoot).§_-F8§[this.position - 1].x;
            this.y = TowerMenu(this.cRoot).§_-F8§[this.position - 1].y;
         }
         this.gotoAndStop(this.§_-7d§);
      }
      
      public function loadData(param1:String, param2:String, param3:int, param4:Boolean, param5:int, param6:int, param7:int = 0, param8:int = 0, param9:String = "", param10:Object = null, param11:String = "") : void
      {
         this.position = param8;
         this.action = param1;
         this.§_-7d§ = param2;
         this.§_-SK§ = param3;
         this.§_-LV§ = param7;
         this.§_-Ed§ = param4;
         this.disabledCondition = param11;
         this.§_-73§ = param5;
         this.§_-Ci§ = param5 + 1;
         this.§_-FT§ = param6;
         this.tooltipClass = param9;
         this.tooltipParams = param10;
         this.§_-GW§.gotoAndStop(this.§_-7d§);
         if(this.§_-73§ >= 1)
         {
            this.§_-SK§ = this.§_-LV§;
         }
         if(this.§_-7d§ == "empty")
         {
            this.updateLevelStatus();
         }
         else
         {
            if(this.position != 0 && this.cRoot != null)
            {
               this.x = TowerMenu(this.cRoot).§_-F8§[this.position - 1].x;
               this.y = TowerMenu(this.cRoot).§_-F8§[this.position - 1].y;
            }
            this.updateLevelStatus();
            if(this.§_-FT§ != 0 && this.§_-73§ == this.§_-FT§)
            {
               this.§_-Oi§();
               return;
            }
            if(this.§_-SK§ != 0)
            {
               this.§_-GW§.MenuItemPrice.txtPrice.text = this.§_-SK§ + "";
               this.§_-GW§.MenuItemPrice.visible = 1;
            }
            else if(this.action != "sell")
            {
               this.§_-GW§.MenuItemPrice.visible = 0;
            }
            if(this.§_-Ed§)
            {
               this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
               this.§_-Ji§ = false;
               this.§_-RC§();
            }
            else
            {
               if(this.§_-SK§ != 0)
               {
                  this.§_-GW§.MenuItemPrice.alpha = 1;
               }
               this.addEventListener(Event.ENTER_FRAME,this.eFrameEvents,false,0,true);
               this.§_-Ji§ = true;
               if(!this.§_-S3§())
               {
                  this.§_-4a§();
               }
               else
               {
                  this.§_-60§();
               }
            }
         }
      }
      
      public function eFrameEvents(param1:Event) : void
      {
         if(this.action == "sell" || this.§_-FT§ != 0 && this.§_-73§ == this.§_-FT§)
         {
            return;
         }
         this.§_-Lw§();
      }
      
      public function §use§() : void
      {
         if(this.§_-Ji§)
         {
            this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
            this.§_-Ji§ = false;
         }
      }
      
      private function §_-Lw§() : void
      {
         if(!this.isActive)
         {
            if(!this.§_-S3§())
            {
               this.§_-4a§();
            }
            else
            {
               this.§_-60§();
            }
         }
      }
      
      public function §_-S3§() : Boolean
      {
         if(MovieClip(this.parent.parent).level.cash >= this.§_-SK§)
         {
            if(this.disabledCondition == "")
            {
               this.isActive = true;
            }
            else if(this.cRoot != null && TowerMenu(this.cRoot).cTower != null)
            {
               if(MovieClip(TowerMenu(this.cRoot).cTower).checkDisableCondition(this.disabledCondition))
               {
                  if(this.isActive == false)
                  {
                     this.§_-60§();
                  }
                  this.isActive = true;
               }
               else
               {
                  this.isActive = false;
               }
            }
         }
         else
         {
            this.isActive = false;
         }
         return this.isActive;
      }
      
      public function clickEvent(param1:MouseEvent) : void
      {
         this.cRoot.execAction(this.action,this);
         if(TowerMenu(this.cRoot).cTower == null)
         {
            return;
         }
         if(this.§_-FT§ != 0)
         {
            this.§_-GW§.MenuItemPrice.txtPrice.text = this.§_-LV§;
            this.§_-GW§.MenuItemPrice.visible = 1;
            this.§_-SK§ = this.§_-LV§;
            this.§_-73§++;
            this.§_-Ci§++;
            this.updateLevelStatus();
            this.towerMenuPowerBuy.gotoAndPlay("on");
            if(this.§_-73§ == this.§_-FT§)
            {
               this.§_-Oi§();
            }
            this.loadTooltip();
            TowerMenu(this.cRoot).§_-D6§();
            TowerMenu(this.cRoot).§_-OX§();
         }
         else if(this.stage != null)
         {
            this.stage.focus = this.stage;
         }
         param1.stopPropagation();
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         TowerMenu(this.cRoot).level.game.gameSounds.playGUIMouseOverCommon();
         this.loadTooltip();
         if(this.§_-FT§ != 0 && this.§_-73§ == this.§_-FT§)
         {
            return;
         }
         if(!this.§_-Ed§)
         {
            if(TowerMenu(this.cRoot).cTower != null)
            {
               MovieClip(TowerMenu(this.cRoot).cTower).checkMenuRollOverAction(this.action);
            }
         }
         if(!this.§_-2b§ && !this.§_-Ed§)
         {
            if(TowerMenu(this.cRoot).cTower == null)
            {
               return;
            }
            this.addGlow();
            this.buttonMode = true;
            this.mouseChildren = false;
            this.useHandCursor = true;
         }
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         TowerMenu(this.cRoot).level.game.gameSounds.stopSound("gui_mouse_over_tower_common");
         TowerMenu(this.cRoot).level.removeToopTip();
         if(this.§_-FT§ != 0 && this.§_-73§ == this.§_-FT§)
         {
            return;
         }
         if(!this.§_-Ed§)
         {
            if(TowerMenu(this.cRoot).cTower != null)
            {
               MovieClip(TowerMenu(this.cRoot).cTower).checkMenuRollOutAction(this.action);
            }
         }
         if(!this.§_-2b§ && !this.§_-Ed§)
         {
            this.§_-Ah§();
            this.useHandCursor = false;
         }
      }
      
      public function loadTooltip() : void
      {
         if(TowerMenu(this.cRoot).cTower == null)
         {
            return;
         }
         if(!TowerMenu(this.cRoot).level.game.main.tooltipsStatus)
         {
            return;
         }
         TowerMenu(this.cRoot).level.addToopTip(new TooltipBasic(new Point(TowerMenu(this.cRoot).x + this.x + 20,TowerMenu(this.cRoot).y + this.y - 20),new Point(TowerMenu(this.cRoot).x + this.x - 20,TowerMenu(this.cRoot).y + this.y + 20),150,this.tooltipParams));
      }
      
      private function §_-60§() : void
      {
         this.§_-2b§ = false;
         this.§_-Ah§();
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.addEventListener(MouseEvent.CLICK,this.clickEvent,false,0,true);
      }
      
      private function §_-4a§() : void
      {
         var _loc2_:int = 0;
         this.§_-2b§ = true;
         this.useHandCursor = false;
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([0.327260926503154,0.407240532175979,0.0654985413208665,0,12.7,0.211440856062325,0.535726075152898,0.0528330687847768,0,12.7,0.201714275171686,0.422196457631477,0.176089267196837,0,12.7,0,0,0,1,0]);
         this.§_-GW§.filters = [_loc1_];
         while(_loc2_ < this.§_-Oo§.length)
         {
            this.§_-Oo§[_loc2_].filters = [_loc1_];
            _loc2_++;
         }
      }
      
      private function §_-Oi§() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.§_-Ah§();
         this.useHandCursor = false;
         this.§_-GW§.MenuItemPrice.txtPrice.text = "";
         this.§_-GW§.MenuItemPrice.visible = 0;
      }
      
      private function §_-RC§() : void
      {
         this.§_-GW§.MenuItemPrice.alpha = 0;
         this.§_-GW§.gotoAndStop("locked");
         this.tooltipParams = {
            "title":Locale.loadStringEx("TOWER_LOCKED_NAME",Locale.getDefaultLang()),
            "text":Locale.loadStringEx("TOWER_LOCKED_DESCRIPTION",Locale.getDefaultLang())
         };
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([0.327260926503154,0.407240532175979,0.0654985413208665,0,12.7,0.211440856062325,0.535726075152898,0.0528330687847768,0,12.7,0.201714275171686,0.422196457631477,0.176089267196837,0,12.7,0,0,0,1,0]);
         this.§_-GW§.filters = [_loc1_];
      }
      
      private function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.7,6,6,6,_loc8_,false,false);
         this.§_-GW§.filters = new Array(_loc9_);
      }
      
      private function §_-Ah§() : void
      {
         var _loc2_:int = 0;
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]);
         this.§_-GW§.filters = [_loc1_];
         while(_loc2_ < this.§_-Oo§.length)
         {
            this.§_-Oo§[_loc2_].filters = [_loc1_];
            _loc2_++;
         }
      }
      
      private function updateLevelStatus() : void
      {
         var _loc1_:int = 0;
         while(_loc1_ < this.§_-Oo§.length)
         {
            if(this.§_-FT§ < _loc1_ + 1)
            {
               MovieClip(this.§_-Oo§[_loc1_]).gotoAndStop("off");
               this.§_-Oo§[_loc1_].visible = 0;
            }
            else
            {
               this.§_-Oo§[_loc1_].visible = 1;
               if(this.§_-73§ > _loc1_)
               {
                  MovieClip(this.§_-Oo§[_loc1_]).gotoAndStop("on");
               }
               else
               {
                  MovieClip(this.§_-Oo§[_loc1_]).gotoAndStop("off");
               }
            }
            _loc1_++;
         }
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.removeEventListener(MouseEvent.ROLL_OVER,this.rollOverEvents);
         this.removeEventListener(MouseEvent.ROLL_OUT,this.rollOutEvents);
         this.removeEventListener(Event.ENTER_FRAME,this.eFrameEvents);
         this.removeEventListener(MouseEvent.CLICK,this.clickEvent);
         this.removeChild(this.level1);
         this.removeChild(this.level2);
         this.removeChild(this.level3);
         this.level1 = null;
         this.level2 = null;
         this.level3 = null;
         this.§_-Oo§ = null;
         this.tooltipParams = null;
         this.towerMenuPowerBuy = null;
         this.cRoot = null;
      }
   }
}
