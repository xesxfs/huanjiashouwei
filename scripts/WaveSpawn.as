package
{
   import com.adobe.utils.StringUtil;
   import flash.utils.getDefinitionByName;
   
   public class WaveSpawn
   {
       
      
      public var creepType:String;
      
      public var creepTypeAux:String;
      
      public var §_-Q0§:String;
      
      public var maxSameCreep:int;
      
      public var cant:int;
      
      public var interval:int;
      
      public var intervalCounter:int;
      
      public var §_-TF§:Boolean;
      
      public var intervalNextSpawn:int;
      
      public var path:int;
      
      public var indexCant:int;
      
      public var indexSwap:int;
      
      public function WaveSpawn(param1:String, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Boolean, param8:int)
      {
         super();
         this.intervalCounter = 0;
         this.indexCant = 1;
         this.indexSwap = 0;
         this.creepType = param1;
         this.creepTypeAux = param2;
         this.§_-Q0§ = param1;
         this.maxSameCreep = param3;
         this.cant = param4;
         this.interval = param5;
         this.intervalNextSpawn = param6;
         this.§_-TF§ = param7;
         this.path = param8;
      }
      
      public function spawnEnemies(param1:Level, param2:int, param3:Wave) : Boolean
      {
         if(this.indexCant > this.cant)
         {
            return false;
         }
         if(this.interval - 1 > this.intervalCounter)
         {
            this.intervalCounter++;
         }
         else
         {
            if(this.creepTypeAux != "")
            {
               if(this.indexSwap == this.maxSameCreep)
               {
                  if(this.§_-Q0§ == this.creepTypeAux)
                  {
                     this.§_-Q0§ = this.creepType;
                  }
                  else
                  {
                     this.§_-Q0§ = this.creepTypeAux;
                  }
                  this.indexSwap = 0;
               }
            }
            else
            {
               this.§_-Q0§ = this.creepType;
            }
            this.spawnEnemy(this.§_-Q0§,param1,param2,param3);
            this.indexSwap++;
            this.indexCant++;
            this.intervalCounter = 0;
         }
         return true;
      }
      
      private function spawnEnemy(param1:String, param2:Level, param3:int, param4:Wave) : *
      {
         var _loc6_:* = undefined;
         var _loc5_:Class = getDefinitionByName(param1) as Class;
         if(!this.§_-TF§)
         {
            _loc6_ = new _loc5_(param3,param2.getRandomPath(param3));
         }
         else
         {
            _loc6_ = new _loc5_(param3,param2.paths[param3][this.path]);
         }
         if(param4.notificationSecondLevel != "" && !param4.notificationSent)
         {
            if(param1 == StringUtil.remove(param4.notificationSecondLevel,"Notification") || StringUtil.beginsWith(param4.notificationSecondLevel,"NotificationTip"))
            {
               param2.sendSecondLevelNotification(param4.notificationSecondLevel);
               param4.notificationSent = true;
            }
         }
         param2.entities.addChild(_loc6_);
         param2.enemies[_loc6_] = _loc6_;
      }
   }
}
