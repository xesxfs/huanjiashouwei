package
{
   import flash.display.MovieClip;
   
   public class §_-Sr§ extends MovieClip
   {
       
      
      public var level:int;
      
      public var target:Tower;
      
      public var durationTime:int;
      
      public var durationTimeCounter:int;
      
      public var cRoot:Level;
      
      public function §_-Sr§(param1:Level, param2:int, param3:Tower)
      {
         super();
         this.x = 0;
         this.y = -7;
         this.cRoot = param1;
         this.level = param2;
         this.target = param3;
         this.durationTimeCounter = 0;
      }
      
      public function onFrameUpdate() : void
      {
      }
      
      public function init() : void
      {
      }
      
      public function removeDebuff() : void
      {
      }
      
      public function runOnFrame() : void
      {
      }
      
      public function showDebuff() : void
      {
      }
      
      public function hideDebuff() : void
      {
      }
      
      public function §_-Nq§() : *
      {
         if(!this.isActive())
         {
            this.removeDebuff();
            return;
         }
         this.runOnFrame();
      }
      
      public function resetToLevel(param1:int) : void
      {
      }
      
      public function isActive() : Boolean
      {
         if(this.durationTimeCounter < this.durationTime)
         {
            this.durationTimeCounter++;
            return true;
         }
         return false;
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
         this.target.removeDebuff(this);
         this.target = null;
         this.cRoot = null;
      }
   }
}
