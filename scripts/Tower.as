package
{
   import com.reintroducing.sound.SoundManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.utils.Dictionary;
   import flash.utils.getQualifiedClassName;
   import org.casalib.math.geom.Ellipse;
   
   public class Tower extends MovieClip
   {
       
      
      public var level:int;
      
      public var isDisabled:Boolean = false;
      
      public var §_-3F§:String;
      
      public var §_-EK§:MovieClip;
      
      public var §_-DO§:Sprite;
      
      public var currentLevel:String = "level_0";
      
      public var building:Boolean = true;
      
      public var buildingTime:int = 0;
      
      public var §_-2I§:int = 0;
      
      public var §_-FH§:§_-NQ§;
      
      public var §_-96§:Sprite;
      
      public var §_-6p§:int;
      
      public var rangeHeight:int = 0;
      
      public var rangeWidth:int = 0;
      
      public var §_-5S§:Boolean = true;
      
      public var target:Enemy;
      
      public var reloadTime:int = 25;
      
      public var reloadTimeCounter:int = 0;
      
      public var §_-Nw§:Boolean = false;
      
      public var §_-IP§:Point;
      
      public var §_-Fl§:Point;
      
      public var §_-Cc§:Point;
      
      public var soldierRallyPoint:Point;
      
      public var rallyPoint:§_-OK§;
      
      public var preMadeLevel:String;
      
      public var cRoot:Level;
      
      public var shootsTotal:int = 0;
      
      public var §extends§:Boolean = true;
      
      public var §_-7T§:Point;
      
      public var §_-GF§:Dictionary;
      
      public function Tower(param1:int, param2:int, param3:Point = null, param4:String = "")
      {
         this.§_-DO§ = new Sprite();
         this.§_-7T§ = new Point(0,-10);
         this.§_-GF§ = new Dictionary(true);
         super();
         this.x = param1;
         this.y = param2;
         this.soldierRallyPoint = param3;
         this.preMadeLevel = param4;
         this.addChild(this.§_-DO§);
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function getInfo() : Object
      {
         return null;
      }
      
      public function frozeTower() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
         }
         this.cRoot.entities.addChild(new IceBlock(this,this.cRoot));
         this.isDisabled = true;
      }
      
      public function §_-RN§() : void
      {
         this.isDisabled = false;
      }
      
      public function veznanBlockTower() : void
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            this.cRoot.forceFreeQuickMenu();
         }
         this.cRoot.entities.addChild(new VeznanBlock(this,this.cRoot));
         this.isDisabled = true;
      }
      
      public function §_-FG§() : void
      {
         this.isDisabled = false;
      }
      
      public function §_-RT§(param1:MovieClip) : void
      {
         this.§_-EK§ = param1;
         this.§_-EK§.x = this.x;
         this.§_-EK§.y = this.y;
         this.§_-EK§.gotoAndStop(this.cRoot.§_-JX§);
         this.cRoot.terrain.addChild(this.§_-EK§);
      }
      
      public function §_-6Q§() : void
      {
         if(this.§_-EK§ != null)
         {
            this.cRoot.terrain.removeChild(this.§_-EK§);
         }
      }
      
      public function §_-JV§(param1:int, param2:int) : void
      {
         this.cRoot.towerRange.width = param1;
         this.cRoot.towerRange.height = param2;
         this.cRoot.towerRange.x = this.x;
         this.cRoot.towerRange.y = this.y - 10;
         this.cRoot.towerRange.visible = true;
      }
      
      public function §_-2S§() : void
      {
         this.cRoot.towerRange.visible = false;
      }
      
      public function showRangeNew(param1:int, param2:int) : void
      {
         this.cRoot.towerRangeNew.width = param1;
         this.cRoot.towerRangeNew.height = param2;
         this.cRoot.towerRangeNew.x = this.x;
         this.cRoot.towerRangeNew.y = this.y - 10;
         this.cRoot.towerRangeNew.visible = true;
      }
      
      public function removeRangeNew() : void
      {
         this.cRoot.towerRangeNew.visible = false;
      }
      
      public function checkMenuRollOverAction(param1:String) : void
      {
      }
      
      public function checkMenuRollOutAction(param1:String) : void
      {
         this.removeRangeNew();
      }
      
      public function §_-P9§() : Boolean
      {
         if(this.cRoot.quickMenu.cTower == this)
         {
            return true;
         }
         return false;
      }
      
      public function rollOverEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.game.gameSounds.playGUIMouseOverCommon();
         if(!this.§_-P9§())
         {
            this.addGlow();
         }
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
      }
      
      public function rollOutEvents(param1:MouseEvent) : void
      {
         if(!this.cRoot.enableElements)
         {
            return;
         }
         this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
         if(!this.§_-P9§())
         {
            this.§_-9H§();
         }
         this.useHandCursor = false;
      }
      
      public function unSelect() : void
      {
         this.cRoot.game.gameSounds.stopSound("gui_mouse_over_tower_common");
         this.cRoot.towerRange.visible = false;
         this.cRoot.towerRangeNew.visible = false;
         this.cRoot.towerRangeRallyPoint.visible = false;
         this.§_-9H§();
      }
      
      public function §_-HP§() : void
      {
         SoundManager.getInstance().playSound("tower_upgrade",this.cRoot.game.gameSounds.V_FX_TOWER_UPGRADE,0,0);
      }
      
      public function §_-FS§() : void
      {
         SoundManager.getInstance().playSound("tower_sell",this.cRoot.game.gameSounds.V_FX_TOWER_SELL,0,0);
      }
      
      public function onRange(param1:Enemy) : Boolean
      {
         return this.§_-R§(new Point(param1.x,param1.y));
      }
      
      public function §_-Pv§(param1:Enemy, param2:int, param3:int) : Boolean
      {
         var _loc4_:* = new Ellipse(this.x - param2 / 2,this.y - 10 - param3 / 2,param2,param3);
         return _loc4_.containsPoint(new Point(param1.x,param1.y));
      }
      
      public function findNewTarget(param1:int, param2:Boolean = true, param3:Boolean = true) : Boolean
      {
         var _loc5_:Enemy = null;
         var _loc4_:Enemy = null;
         this.target = null;
         for each(_loc5_ in this.cRoot.enemies)
         {
            if(_loc5_.isActive && (param3 || !_loc5_.isBoss) && _loc5_.level <= param1 && (param2 || !_loc5_.isFlying) && this.onRange(_loc5_))
            {
               if(_loc4_ == null || this.§_-ET§(_loc4_,_loc5_))
               {
                  _loc4_ = _loc5_;
               }
            }
         }
         if(_loc4_ != null)
         {
            this.target = _loc4_;
            return true;
         }
         return false;
      }
      
      public function §_-ET§(param1:Enemy, param2:Enemy) : Boolean
      {
         if(param1.road.length - param1.currentNode > param2.road.length - param2.currentNode)
         {
            return true;
         }
         return false;
      }
      
      public function findAnyTarget(param1:int, param2:Boolean = true) : Boolean
      {
         var _loc3_:Enemy = null;
         this.target = null;
         for each(_loc3_ in this.cRoot.enemies)
         {
            if(_loc3_.isActive && _loc3_.level <= param1 && (param2 || _loc3_.isFlying) && this.onRange(_loc3_))
            {
               this.target = _loc3_;
               return true;
            }
         }
         return false;
      }
      
      public function §_-Ac§() : void
      {
         if(!this.§_-Nw§)
         {
            this.reloadTimeCounter++;
            if(this.reloadTimeCounter >= this.reloadTime)
            {
               this.§_-Nw§ = true;
               this.reloadTimeCounter = 0;
            }
         }
      }
      
      public function §_-OW§() : Boolean
      {
         if(this.building)
         {
            if(this.buildingTime == this.§_-2I§)
            {
               this.building = false;
               this.upgradeTower("level_1");
               this.§_-FH§.destroyThis();
               this.§_-FH§ = null;
            }
            else
            {
               this.§_-2I§++;
               this.§_-FH§.onFrameUpdate();
            }
            return true;
         }
         return false;
      }
      
      public function shoot() : void
      {
      }
      
      public function upgradeTower(param1:String) : void
      {
      }
      
      public function displayTowerMenu() : void
      {
      }
      
      public function §_-GI§(param1:MovieClip) : void
      {
         this.§_-DO§.addChild(param1);
      }
      
      public function getGraphic() : MovieClip
      {
         return MovieClip(this.§_-DO§.getChildAt(0));
      }
      
      public function §_-38§() : void
      {
         this.§_-DO§.removeChildAt(0);
      }
      
      public function §_-PA§(param1:MovieClip) : void
      {
         this.cRoot.bullets.addChild(new TowerBuildingCloud(new Point(this.x,this.y)));
         this.§_-DO§.removeChildAt(0);
         this.§_-DO§.addChild(param1);
      }
      
      public function §_-R§(param1:Point) : Boolean
      {
         var _loc2_:* = new Ellipse(this.x - this.rangeWidth / 2,this.y - 10 - this.rangeHeight / 2,this.rangeWidth,this.rangeHeight);
         return _loc2_.containsPoint(param1);
      }
      
      public function getSellValue() : int
      {
         return this.§_-6p§ * this.cRoot.gameSettings.sellPercent;
      }
      
      public function getColor(param1:Number, param2:Number, param3:Boolean = false) : String
      {
         var _loc4_:Number = NaN;
         if(!param3)
         {
            _loc4_ = param2 - param1;
         }
         else
         {
            _loc4_ = param1 - param2;
         }
         if(_loc4_ > 0)
         {
            return "green";
         }
         if(_loc4_ < 0)
         {
            return "red";
         }
         return "white";
      }
      
      public function getColorByLevel(param1:int, param2:int) : String
      {
         if(param1 == 0 || param1 == param2)
         {
            return "white";
         }
         return "green";
      }
      
      public function getNextLevel(param1:int, param2:int) : int
      {
         if(param1 == param2)
         {
            return param2;
         }
         return param1 + 1;
      }
      
      public function §_-1r§() : void
      {
      }
      
      public function §_-Lm§() : void
      {
         if(this.rallyPoint != null)
         {
            this.rallyPoint.destroyThis();
            this.rallyPoint = null;
         }
      }
      
      protected function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.7,6,6,6,_loc8_,false,false);
         this.getGraphic().filters = new Array(_loc9_);
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      protected function §_-9H§() : void
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]);
         this.getGraphic().filters = [_loc1_];
      }
      
      protected function § if§() : void
      {
         var _loc1_:§_-Sr§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.§_-Nq§();
         }
      }
      
      protected function §_-f§() : void
      {
         var _loc1_:§_-Sr§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.pause();
         }
      }
      
      protected function §_-MJ§() : void
      {
         var _loc1_:§_-Sr§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.unPause();
         }
      }
      
      public function addDebuff(param1:§_-Sr§) : void
      {
         var _loc2_:§_-Sr§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            if(getQualifiedClassName(_loc2_) == getQualifiedClassName(param1))
            {
               if(_loc2_.level > param1.level)
               {
                  return;
               }
               _loc2_.resetToLevel(param1.level);
               return;
            }
         }
         this.§_-GF§[param1] = param1;
         param1.init();
      }
      
      public function showAllDebuff() : void
      {
         var _loc1_:§_-Sr§ = null;
         for each(_loc1_ in this.§_-GF§)
         {
            _loc1_.showDebuff();
         }
      }
      
      public function removeDebuff(param1:§_-Sr§) : void
      {
         if(this.contains(param1))
         {
            this.removeChild(param1);
         }
         delete this.§_-GF§[param1];
      }
      
      public function hasDebuff(param1:String) : Boolean
      {
         var _loc2_:§_-Sr§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            if(getQualifiedClassName(_loc2_) == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-BN§(param1:Boolean = true) : void
      {
         var _loc2_:§_-Sr§ = null;
         for each(_loc2_ in this.§_-GF§)
         {
            _loc2_.removeDebuff();
         }
      }
      
      public function getReloadModifier(param1:int) : int
      {
         return param1 * this.reloadTime / 100;
      }
      
      public function addReloadModifier(param1:int) : void
      {
         this.reloadTime = this.reloadTime - param1;
      }
      
      public function removeReloadModifier(param1:int) : void
      {
         this.reloadTime = this.reloadTime + param1;
      }
      
      public function getRangeModifier(param1:int) : int
      {
         return param1 * this.rangeWidth / 100;
      }
      
      public function addRangeModifier(param1:int) : void
      {
         this.rangeWidth = this.rangeWidth + param1;
         this.rangeHeight = this.rangeWidth * this.cRoot.gameSettings.rangeRatio;
      }
      
      public function removeRangeModifier(param1:int) : void
      {
         this.rangeWidth = this.rangeWidth - param1;
         this.rangeHeight = this.rangeWidth * this.cRoot.gameSettings.rangeRatio;
      }
   }
}
