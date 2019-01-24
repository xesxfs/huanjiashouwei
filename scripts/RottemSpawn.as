package
{
   import flash.display.MovieClip;
   
   public class RottemSpawn extends MovieClip
   {
       
      
      private var spawnTime:int;
      
      private var §_-0i§:int;
      
      private var maxTrees:int;
      
      private var isActive:Boolean;
      
      private var cRoot:Level;
      
      public function RottemSpawn(param1:Level)
      {
         super();
         this.cRoot = param1;
         this.spawnTime = 0;
         this.§_-0i§ = 0;
         this.maxTrees = 0;
         this.isActive = true;
      }
      
      public function onFrameUpdate() : void
      {
         if(!this.isActive)
         {
            return;
         }
         if(this.cRoot.§_-4R§ != Level.LEVEL_NORMAL)
         {
            return;
         }
         if(this.spawnTime == 0)
         {
            return;
         }
         this.§_-0i§++;
         if(this.§_-0i§ < this.spawnTime)
         {
            return;
         }
         var _loc1_:int = 1;
         while(_loc1_ <= this.maxTrees)
         {
            this.spawnTrees();
            _loc1_++;
         }
         this.§_-0i§ = 0;
      }
      
      public function §_-Ti§() : void
      {
         this.isActive = false;
      }
      
      public function pause() : void
      {
      }
      
      public function unPause() : void
      {
      }
      
      public function updateSpawnTimers() : void
      {
         this.spawnTime = this.cRoot.gameSettings.specials.rottemSpawn.spawnTimers[this.cRoot.currentWave - 1][0] * this.cRoot.gameSettings.framesRate;
         this.§_-0i§ = 0;
         this.maxTrees = this.cRoot.gameSettings.specials.rottemSpawn.spawnTimers[this.cRoot.currentWave - 1][1];
      }
      
      public function spawnTrees() : void
      {
         var _loc1_:int = this.getRandom(0,this.cRoot.paths.length - 1);
         var _loc2_:int = this.getRandom(0,2);
         var _loc3_:int = Math.floor(this.getRandom(30,this.cRoot.paths[_loc1_][_loc2_].length - 60));
         var _loc4_:Enemy = new EnemyRottenTree(_loc1_,this.cRoot.paths[_loc1_][_loc2_],_loc3_,this.cRoot.paths[_loc1_][_loc2_][_loc3_],true);
         this.cRoot.entities.addChild(_loc4_);
         this.cRoot.enemies[_loc4_] = _loc4_;
      }
      
      public function getRandom(param1:*, param2:*) : Number
      {
         var _loc3_:Number = NaN;
         _loc3_ = Math.round(Math.random() * (param2 - param1)) + param1;
         return _loc3_;
      }
      
      public function destroyThis() : void
      {
         this.cRoot = null;
         this.parent.removeChild(this);
      }
   }
}
