import { HanoSnapchatLensEntityBase } from '../HanoSnapchatLensEntityBase';
import type { HanoSnapchatLensSDK } from '../HanoSnapchatLensSDK';
import type { Control } from '../types';
import type { Lens, LensListMatch } from '../HanoSnapchatLensTypes';
declare class LensEntity extends HanoSnapchatLensEntityBase<Lens> {
    constructor(client: HanoSnapchatLensSDK, entopts: any);
    make(this: LensEntity): LensEntity;
    list(this: any, reqmatch?: LensListMatch, ctrl?: Control): Promise<LensEntity[]>;
}
export { LensEntity };
