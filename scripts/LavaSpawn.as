package
{
   import flash.display.MovieClip;
   import flash.geom.Point;
   
   public class LavaSpawn extends MovieClip
   {
       
      
      private var spawnTime:int;
      
      private var spawnAuxTime:int;
      
      private var §_-Hc§:Boolean;
      
      private var §_-0i§:int = 0;
      
      private var cRoot:Level;
      
      public function LavaSpawn(param1:Level)
      {
         super();
         this.§_-Hc§ = true;
         this.cRoot = param1;
         this.spawnTime = this.cRoot.gameSettings.specials.lavaSpawn.spawnTime;
         this.spawnAuxTime = this.cRoot.gameSettings.specials.lavaSpawn.spawnAuxTime;
      }
      
      public function onFrameUpdate() : void
      {
         if(this.cRoot.§_-4R§ != Level.LEVEL_NORMAL)
         {
            return;
         }
         this.§_-0i§++;
         if(this.§_-0i§ < this.spawnTime)
         {
            return;
         }
         this.§_-Hl§();
         this.§_-0i§ = 0;
         if(this.§_-Hc§)
         {
            this.spawnTime = this.spawnAuxTime;
            this.§_-Hc§ = false;
         }
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function §_-Hl§() : void
      {
         var _loc1_:int = 0;
         if(Math.random() > 0.5)
         {
            _loc1_ = 2;
         }
         else
         {
            _loc1_ = 3;
         }
         var _loc2_:Enemy = new EnemyLavaElemental(_loc1_,this.cRoot.paths[_loc1_][0],1,new Point(341,299));
         this.cRoot.entities.addChild(_loc2_);
         this.cRoot.enemies[_loc2_] = _loc2_;
         if(!this.cRoot.game.gameEncyclopedia.notificationEnemyLavaElemental)
         {
            this.cRoot.sendSecondLevelNotification("NotificationEnemyLavaElemental");
            this.cRoot.game.gameEncyclopedia.notificationEnemyLavaElemental = true;
            this.cRoot.game.gameEncyclopedia.saveData();
         }
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
