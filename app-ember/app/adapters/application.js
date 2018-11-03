import ENV from '../config/environment';
import { computed } from '@ember/object';
import { getOwner } from '@ember/application';
import { inject } from '@ember/service';
import ActiveModelAdapter from 'active-model-adapter';

export default ActiveModelAdapter.extend({
  session: inject.service('session'),
  store: inject.service('store'),
  namespace: ENV.apiNamespace || 'api/v1',
  coalesceFindRequests: true,

  /* Set application authentication header */
  headers: computed('session.content.token', function() {
    var token = this.get('session.content.token');

    if (token) {
      return {
        Authorization: 'Token token=' + token
      };
    }
    else {
      return { };
    }
  }),

  handleResponse(status/*, headers, payload*/) {
    if (status === 401) {
      return this.get('session').close().finally(() => {
        const router = getOwner(this).lookup('router:main');

        router.transitionTo('login');
        this.store.unloadAll();
        return this._super(...arguments);
      });
    } else {
      return this._super(...arguments);
    }
  },
});
