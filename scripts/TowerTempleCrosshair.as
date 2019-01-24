package
{
   import com.dougmccune.HitTester;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class TowerTempleCrosshair extends MovieClip
   {
       
      
      public var hitAreaMe:MovieClip;
      
      protected var errorTime:int;
      
      protected var errorTimeCounter:int;
      
      protected var tower:TowerTemple;
      
      protected var cRoot:Level9;
      
      public function TowerTempleCrosshair(param1:Level9, param2:TowerTemple)
      {
         super();
         addFrameScript(0,this.frame1);
         this.errorTime = 10;
         this.errorTimeCounter = 0;
         this.tower = param2;
         this.cRoot = param1;
         this.cRoot.templeCrosshair = this;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function init(param1:Event) : void
      {
         this.x = stage.mouseX;
         this.y = stage.mouseY;
         this.stage.focus = this.stage;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.shootRay,false,0,true);
      }
      
      public function shootRay(param1:MouseEvent) : void
      {
         if(!this.§_-0u§())
         {
            this.gotoAndStop("error");
            this.errorTimeCounter = 1;
            return;
         }
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.cRoot.templeCrosshair = null;
         this.destroyThis();
      }
      
      public function §_-0u§() : Boolean
      {
         var _loc2_:Enemy = null;
         var _loc1_:Enemy = null;
         for each(_loc2_ in this.cRoot.enemies)
         {
            if(_loc2_ != null && _loc2_.isActive && HitTester.realHitTest(_loc2_,new Point(this.x,this.y),this.cRoot))
            {
               if(_loc1_ == null || _loc1_.y < _loc2_.y)
               {
                  _loc1_ = _loc2_;
               }
            }
         }
         if(_loc1_ != null)
         {
            this.tower.shootRay(_loc1_);
            return true;
         }
         return false;
      }
      
      public function §_-Sf§() : void
      {
         this.cRoot.templeCrosshair = null;
         this.cRoot.menu.forceHideInfo();
         this.cRoot.§_-Fe§();
         this.destroyThis();
      }
      
      public function onFrameUpdate() : void
      {
         if(this.errorTimeCounter != 0)
         {
            if(this.errorTimeCounter < this.errorTime)
            {
               this.errorTimeCounter++;
            }
            else
            {
               this.gotoAndStop("normal");
               this.errorTimeCounter = 0;
            }
         }
         this.x = stage.mouseX;
         this.y = stage.mouseY;
      }
      
      public function pause() : void
      {
         this.stop();
      }
      
      public function unPause() : void
      {
         this.play();
      }
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.shootRay);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
      
      function frame1() : *
      {
         stop();
      }
   }
}
