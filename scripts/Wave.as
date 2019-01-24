package
{
   public class Wave
   {
       
      
      public var spawns:Array;
      
      public var counter:int = 0;
      
      public var interval:int = 0;
      
      public var §_-JF§:int = 0;
      
      public var indexSpawn:int = 0;
      
      public var §_-1o§:Boolean;
      
      public var §_-OA§:int;
      
      public var notification:String;
      
      public var notificationSecondLevel:String;
      
      public var notificationSent:Boolean;
      
      public var §_-RF§:Boolean;
      
      public function Wave(param1:Array, param2:int, param3:int, param4:String = "", param5:String = "", param6:Boolean = false)
      {
         this.spawns = [];
         super();
         this.spawns = param1;
         this.interval = param2;
         this.§_-JF§ = param3;
         this.counter = 0;
         this.indexSpawn = 0;
         this.§_-1o§ = false;
         this.notification = param4;
         this.notificationSecondLevel = param5;
         this.notificationSent = false;
         this.§_-RF§ = param6;
      }
      
      public function spawnEnemies(param1:Level) : Boolean
      {
         if(this.indexSpawn < this.spawns.length)
         {
            if(this.§_-1o§)
            {
               if(this.§_-OA§ < this.spawns[this.indexSpawn].intervalNextSpawn)
               {
                  this.§_-OA§++;
                  return true;
               }
               this.indexSpawn++;
               this.§_-1o§ = false;
               return true;
            }
            if(!this.spawns[this.indexSpawn].spawnEnemies(param1,this.§_-JF§,this))
            {
               this.§_-1o§ = true;
               this.§_-OA§ = 0;
               if(this.indexSpawn + 1 == this.spawns.length)
               {
                  this.indexSpawn++;
                  return false;
               }
            }
            return true;
         }
         delete param1.activeWaves[this];
         return false;
      }
      
      public function showWaveFlag(param1:Level, param2:int, param3:int) : void
      {
         var _loc4_:WaveFlag = null;
         var _loc5_:Boolean = false;
         if(param3 == 0)
         {
            _loc5_ = true;
            param2 = 1;
         }
         _loc4_ = new WaveFlag(param1,param1.§_-Az§[this.§_-JF§][0],param1.§_-Az§[this.§_-JF§][1],param2,this,_loc5_,this.§_-RF§);
         param1.bullets.addChild(_loc4_);
         param1.§_-Ga§(_loc4_);
      }
      
      public function getToolTip(param1:Level) : Array
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         var _loc8_:int = 0;
         while(_loc8_ < this.spawns.length)
         {
            if(this.spawns[_loc8_].creepTypeAux == "")
            {
               _loc3_ = this.§_-EW§(_loc2_,this.spawns[_loc8_].creepType);
               if(_loc3_ == -1)
               {
                  _loc2_.push([param1.gameSettings.getEnemieName(this.spawns[_loc8_].creepType),this.spawns[_loc8_].cant,this.spawns[_loc8_].creepType]);
               }
               else
               {
                  _loc2_[_loc3_][1] = _loc2_[_loc3_][1] + this.spawns[_loc8_].cant;
               }
            }
            else
            {
               _loc4_ = Math.floor(this.spawns[_loc8_].cant / this.spawns[_loc8_].maxSameCreep);
               _loc7_ = this.spawns[_loc8_].cant % this.spawns[_loc8_].maxSameCreep;
               _loc5_ = Math.ceil(_loc4_ / 2) * this.spawns[_loc8_].maxSameCreep;
               _loc6_ = Math.floor(_loc4_ / 2) * this.spawns[_loc8_].maxSameCreep;
               if(_loc4_ % 2 == 0)
               {
                  _loc5_ = _loc5_ + _loc7_;
               }
               else
               {
                  _loc6_ = _loc6_ + _loc7_;
               }
               _loc3_ = this.§_-EW§(_loc2_,this.spawns[_loc8_].creepType);
               if(_loc3_ == -1)
               {
                  _loc2_.push([param1.gameSettings.getEnemieName(this.spawns[_loc8_].creepType),_loc5_,this.spawns[_loc8_].creepType]);
               }
               else
               {
                  _loc2_[_loc3_][1] = _loc2_[_loc3_][1] + _loc5_;
               }
               _loc3_ = this.§_-EW§(_loc2_,this.spawns[_loc8_].creepTypeAux);
               if(_loc3_ == -1)
               {
                  _loc2_.push([param1.gameSettings.getEnemieName(this.spawns[_loc8_].creepTypeAux),_loc6_,this.spawns[_loc8_].creepTypeAux]);
               }
               else
               {
                  _loc2_[_loc3_][1] = _loc2_[_loc3_][1] + _loc6_;
               }
            }
            _loc8_++;
         }
         return _loc2_;
      }
      
      private function §_-EW§(param1:Array, param2:String) : int
      {
         var _loc3_:int = 0;
         while(_loc3_ < param1.length)
         {
            if(param1[_loc3_][2] == param2)
            {
               return _loc3_;
            }
            _loc3_++;
         }
         return -1;
      }
      
      public function destroyThis() : void
      {
         this.spawns = null;
      }
   }
}
