export namespace types {
	
	export enum UserPreferencesKeys {
	    DARK_MODE_ACTIVE = "darkModeActive",
	    LANGUAGE = "language",
	}
	export class UserPreferences {
	    darkModeActive: boolean;
	    language: string;
	
	    static createFrom(source: any = {}) {
	        return new UserPreferences(source);
	    }
	
	    constructor(source: any = {}) {
	        if ('string' === typeof source) source = JSON.parse(source);
	        this.darkModeActive = source["darkModeActive"];
	        this.language = source["language"];
	    }
	}

}

