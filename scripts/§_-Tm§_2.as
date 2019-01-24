package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-Tm§ extends MovieClip
   {
       
      
      protected var errorTime:int;
      
      protected var errorTimeCounter:int;
      
      protected var cRoot:Level;
      
      protected var power:§_-5g§;
      
      public function §_-Tm§(param1:Level, param2:§_-5g§)
      {
         super();
         this.errorTime = 20;
         this.errorTimeCounter = 0;
         this.cRoot = param1;
         this.power = param2;
         this.addEventListener(Event.ADDED_TO_STAGE,this.init,false,0,true);
      }
      
      public function createPower() : void
      {
      }
      
      public function canFirePower() : Boolean
      {
         return true;
      }
      
      public function init(param1:Event) : void
      {
         this.x = stage.mouseX;
         this.y = stage.mouseY;
         this.addEventListener(MouseEvent.MOUSE_DOWN,this.intro,false,0,true);
      }
      
      public function intro(param1:MouseEvent) : void
      {
         if(this.hitTestObject(this.power))
         {
            this.cancelPower();
            return;
         }
         this.§_-4D§();
         param1.stopPropagation();
      }
      
      public function §_-4D§() : void
      {
         if(!this.canFirePower())
         {
            this.gotoAndStop("error");
            this.errorTimeCounter = 1;
            return;
         }
         this.createPower();
         this.power.reset();
         this.cRoot.data.§_-4O§ = this.cRoot.data.§_-4O§ + 1;
         this.cRoot.menu.forceHideInfo();
         this.destroyThis();
      }
      
      public function cancelPower() : void
      {
         this.cRoot.freeMenues();
         this.cRoot.menu.forceHideInfo();
         this.power.§_-Dv§();
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
      
      public function destroyThis() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.intro);
         this.removeEventListener(Event.ADDED_TO_STAGE,this.init);
         this.parent.removeChild(this);
      }
   }
}
