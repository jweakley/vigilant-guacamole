import Component from '@ember/component';
import { computed } from '@ember/object';
const definedTypes = ['grass', 'ocean', 'mountain'];

export default Component.extend({
  tagName: '',
  didReceiveAttrs() {
    if (definedTypes.includes(this.get('tile.type'))) {
      this.set('tileComponentName',  `area-map/tiles/-${this.get('tile.type')}`)
    } else {
      this.set('tileComponentName', 'area-map/tiles/-blank');
    }
  },

  actions: {
    move() {
      debugger;
    },
  }
});
