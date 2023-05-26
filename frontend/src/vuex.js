import createPersistedState from 'vuex-persistedstate';
import { createStore } from 'vuex'

const store = createStore({
    state:{
        user : null,
        type_admin:null
    },

      plugins: [
    createPersistedState({
      key: 'type_admin',
      storage: window.sessionStorage
    })
  ],
    
    mutations:{
        updateUser(state,payload){
            state.user = payload;
        },

         updateTypeAdmin(state,payload){
            state.type_admin = payload;
        }
    }
});

export default store;