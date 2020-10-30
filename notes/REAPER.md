# REAPER DAW Notes

## Record All PC Input
This works for me in Windows 10.
```
Set Audio Devices in Preferences.
  Audio system: WASAPI
  Mode: Shared loopback (CAUTION)
  Input channels: 2

You can ignore a pop-up warning about not being able to initialize the input.

Create a new track.

MAKE SURE YOU DISABLE MONITORING!
  Little speaker looking button next to the "arm record" button for the track.
  You should be able to hover and confirm it's set to "Record Monitoring: OFF"
```

And that should do it! Test by recording, and you'll see the recording box thingy start expanding in the track. Whenever you start playing sound elsewhere you'll see the waveform appear too.

If you get feedback it's because you didn't disable monitoring.
