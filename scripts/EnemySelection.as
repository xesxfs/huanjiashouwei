package
{
   import flash.display.MovieClip;
   
   public class EnemySelection extends MovieClip
   {
       
      
      public var enemy:Enemy;
      
      public var isActive:Boolean;
      
      public function EnemySelection()
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
         if(this.enemy == null || !this.enemy.isActive)
         {
            this.unSetEnemy();
            return;
         }
         this.x = this.enemy.x;
         this.y = this.enemy.y;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function setEnemy(param1:Enemy) : void
      {
         this.enemy = param1;
         this.x = this.enemy.x;
         this.y = this.enemy.y;
         this.isActive = true;
         this.visible = true;
      }
      
      public function unSetEnemy() : void
      {
         this.enemy = null;
         this.isActive = false;
         this.visible = false;
      }
      
      private function destroyThis() : void
      {
         this.parent.removeChild(this);
      }
   }
}
