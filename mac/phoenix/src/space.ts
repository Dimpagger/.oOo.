import { restoreMousePositionForWindow } from './mouse';
import { moveToScreen } from './screen';

export function moveWindowToTargetSpace(window: Window, nextWindow: Window | null, allSpaces: Space[], spaceIndex: number) {
  const targetSpace = allSpaces[spaceIndex];
  const currentSpaceOptional = Space.active();
  if (currentSpaceOptional === undefined) {
    return;
  }
  const currentSpace = currentSpaceOptional;
  // _.map(targetSpace.windows(), (w) => { alert(w.title()); } );
  if (currentSpace.screens()[0].hash() !== targetSpace.screens()[0].hash()) {
    moveToScreen(window, targetSpace.screens()[0]);
  }
  currentSpace.removeWindows([window]);
  targetSpace.addWindows([window]);
  if (nextWindow) {
    // App.get('Finder').focus(); // Hack for Screen unfocus
    // nextWindow.raise();
    nextWindow.focus();
    restoreMousePositionForWindow(nextWindow);
  }
}