package
{
   public class §_-27§
   {
       
      
      public var level:int;
      
      public var target:Enemy;
      
      public var durationTime:int;
      
      public var durationTimeCounter:int;
      
      public var cRoot:Level;
      
      public function §_-27§(param1:Level, param2:int, param3:Enemy)
      {
         super();
         this.cRoot = param1;
         this.level = param2;
         this.target = param3;
         this.durationTimeCounter = 0;
      }
      
      public function init() : void
      {
      }
      
      public function removeDebuff(param1:Boolean) : void
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
            this.removeDebuff(true);
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
      
      public function destroyThis() : void
      {
         this.target.removeDebuff(this);
         this.target = null;
         this.cRoot = null;
      }
   }
}
