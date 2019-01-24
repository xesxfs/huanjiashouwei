package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.BitmapFilterQuality;
   import flash.filters.ColorMatrixFilter;
   import flash.filters.GlowFilter;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class §_-Jx§ extends MovieClip
   {
       
      
      public var §_-PS§:MovieClip;
      
      public var selected:MovieClip;
      
      public var healthbar:MovieClip;
      
      public var §_-Jh§:TextField;
      
      private var §_-3W§:§_-2A§;
      
      private var loadingMask:§_-CX§;
      
      private var loadingSubMask:§_-CX§;
      
      private var §_-Dd§:Boolean;
      
      private var cRoot:Level;
      
      public function §_-Jx§(param1:§_-2A§, param2:Level)
      {
         super();
         this.§_-3W§ = param1;
         this.loadingMask = new §_-CX§(new Point(25,47),false);
         this.loadingSubMask = new §_-CX§(new Point(25,47),false);
         this.loadingSubMask.alpha = 0.9;
         this.gotoAndStop(this.§_-3W§.§_-Gv§);
         this.x = 35;
         this.y = 60;
         this.cRoot = param2;
         this.selected.visible = false;
         this.addEventListener(MouseEvent.ROLL_OVER,this.rollOver,false,0,true);
         this.addEventListener(MouseEvent.ROLL_OUT,this.rollOut,false,0,true);
         this.addEventListener(MouseEvent.CLICK,this.clickEvents,false,0,true);
      }
      
      public function rollOver(param1:MouseEvent) : void
      {
         this.buttonMode = true;
         this.mouseChildren = false;
         this.useHandCursor = true;
         this.addGlow();
      }
      
      public function rollOut(param1:MouseEvent) : void
      {
         this.useHandCursor = false;
         this.§_-Ah§();
      }
      
      public function clickEvents(param1:MouseEvent) : void
      {
         this.click();
      }
      
      public function click() : void
      {
         if(this.§_-Dd§)
         {
            return;
         }
         if(this.selected.visible)
         {
            this.§_-HS§();
         }
         else
         {
            this.§_-3W§.§_-48§();
         }
      }
      
      public function §_-HS§() : void
      {
         this.setNormal();
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         if(this.cRoot.heroRallyPoint != null)
         {
            this.cRoot.heroRallyPoint.destroyThis();
         }
         this.cRoot.soldierSelection.soldier = null;
      }
      
      public function updateHealth() : void
      {
         var _loc1_:int = this.§_-3W§.getHealth();
         MovieClip(this.healthbar).scaleX = 1 - (this.§_-3W§.getInitHealth() - _loc1_) / this.§_-3W§.getInitHealth();
      }
      
      public function updateXp() : void
      {
         if(this.§_-3W§.level == 10)
         {
            MovieClip(this.§_-PS§).scaleX = 1;
            return;
         }
         var _loc1_:int = this.cRoot.gameSettings.heroes.masterTable.masterXp[this.§_-3W§.level - 1];
         var _loc2_:int = this.cRoot.gameSettings.heroes.masterTable.masterXp[this.§_-3W§.level] - _loc1_;
         var _loc3_:Number = this.§_-3W§.§_-IH§;
         MovieClip(this.§_-PS§).scaleX = 1 - (_loc2_ - (_loc3_ - _loc1_)) / _loc2_;
      }
      
      public function updateLevel() : void
      {
         TextField(this.§_-Jh§).text = this.§_-3W§.level.toString();
      }
      
      public function §_-48§() : void
      {
         this.selected.visible = true;
      }
      
      public function setNormal() : void
      {
         this.selected.visible = false;
      }
      
      public function §_-1t§() : void
      {
         this.addChild(this.loadingMask);
         this.addChild(this.loadingSubMask);
         this.loadingMask.reset();
         this.§_-Dd§ = true;
      }
      
      public function endLoading() : void
      {
         if(!this.contains(this.loadingMask))
         {
            return;
         }
         this.removeChild(this.loadingMask);
         this.removeChild(this.loadingSubMask);
         this.§_-Dd§ = false;
      }
      
      private function addGlow() : void
      {
         var _loc8_:Number = BitmapFilterQuality.HIGH;
         var _loc9_:GlowFilter = new GlowFilter(16772164,0.7,6,6,4,_loc8_,false,false);
         this.filters = new Array(_loc9_);
      }
      
      private function §_-Ah§() : void
      {
         var _loc1_:ColorMatrixFilter = new ColorMatrixFilter([1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0]);
         this.filters = [_loc1_];
      }
      
      public function updateLoading(param1:int, param2:int) : void
      {
         this.loadingMask.updateLoadingBar(param1,param2);
      }
   }
}
