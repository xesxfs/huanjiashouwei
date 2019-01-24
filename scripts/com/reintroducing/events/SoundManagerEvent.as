package com.reintroducing.events
{
   import com.reintroducing.sound.SoundItem;
   import flash.events.Event;
   
   public class SoundManagerEvent extends Event
   {
      
      public static const SOUND_ITEM_ADDED:String = "sound.item.added";
      
      public static const SOUND_ITEM_REMOVED:String = "sound.item.removed";
      
      public static const SOUND_ITEM_PLAY_START:String = "sound.item.play.start";
      
      public static const SOUND_ITEM_PAUSE:String = "sound.item.pause";
      
      public static const SOUND_ITEM_STOP:String = "sound.item.stop";
      
      public static const SOUND_ITEM_PLAY_COMPLETE:String = "sound.item.play.complete";
      
      public static const SOUND_ITEM_FADE:String = "sound.item.fade";
      
      public static const SOUND_ITEM_FADE_COMPLETE:String = "sound.item.fade.complete";
      
      public static const SOUND_ITEM_LOAD_ERROR:String = "sound.item.load.error";
      
      public static const SOUND_ITEM_LOAD_PROGRESS:String = "sound.item.load.progress";
      
      public static const SOUND_ITEM_LOAD_COMPLETE:String = "sound.item.load.complete";
      
      public static const REMOVED_ALL:String = "removed.all";
      
      public static const PLAY_ALL:String = "play.all";
      
      public static const STOP_ALL:String = "stop.all";
      
      public static const PAUSE_ALL:String = "pause.all";
      
      public static const MUTE_ALL:String = "mute.all";
      
      public static const UNMUTE_ALL:String = "unmute.all";
       
      
      public var soundItem:SoundItem;
      
      public var duration:Number;
      
      public var percent:Number;
      
      public function SoundManagerEvent(param1:String, param2:SoundItem = null, param3:Number = 0, param4:Number = 0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.soundItem = param2;
         this.duration = param3;
         this.percent = param4;
      }
      
      override public function clone() : Event
      {
         return new SoundManagerEvent(type,this.soundItem,this.duration,this.percent,bubbles,cancelable);
      }
      
      override public function toString() : String
      {
         return formatToString("SoundManagerEvent","soundItem","duration","percent","type","bubbles","cancelable");
      }
   }
}
