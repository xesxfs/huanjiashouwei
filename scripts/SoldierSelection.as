package
{
   import flash.display.MovieClip;
   
   public class SoldierSelection extends MovieClip
   {
       
      
      public var soldier:Soldier;
      
      public var isActive:Boolean;
      
      public function SoldierSelection()
      {
         super();
         this.isActive = false;
         this.visible = false;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            return;
         }
         if(this.soldier == null || !this.soldier.isActive)
         {
            this.§_-G9§();
            return;
         }
         this.x = this.soldier.x;
         this.y = this.soldier.y;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function setSoldier(param1:Soldier) : void
      {
         this.soldier = param1;
         this.x = this.soldier.x;
         this.y = this.soldier.y;
         this.isActive = true;
         this.visible = true;
      }
      
      public function §_-G9§() : void
      {
         this.soldier = null;
         this.isActive = false;
         this.visible = false;
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
