//
//  DateFormat.swift
//  MetroNews
//
//  Created by NIKOLAI BORISOV on 18.12.2021.
//

import Foundation

enum DateFormat {
    static let EEEE_MMM_d_yyyy = "EEEE, MMM d, yyyy" // Wednesday, Sep 12, 2018
    static let MM_dd_yyyy = "MM/dd/yyyy" // 09/12/2018
    static let MM_dd_yyyy_HH_mm = "MM-dd-yyyy HH:mm" // 09-12-2018 14:11
    static let MMM_d_h_mm_a = "MMM d, h:mm a" // Sep 12, 2:11 PM
    static let MMM_dd_hh_mm_a = "MMM dd, hh:mm a" // Sep 12, 02:11 PM
    static let MMMM_yyyy = "MMMM yyyy" // September 2018
    static let MMM_d_yyyy = "MMM d, yyyy" // Sep 12, 2018
    static let E_d_MMM_yyyy_HH_mm_ss_Z = "E, d MMM yyyy HH:mm:ss Z" // Wed, 12 Sep 2018 14:11:54 +0000
    static let yyyy_MM_dd_T_HH_mm_ssZ = "yyyy-MM-dd'T'HH:mm:ssZ" // 2018-09-12T14:11:54+0000
    static let dd_MM_yy = "dd.MM.yy" // 12.09.18
    static let HH_mm_ss_SSS = "MHH:mm:ss.SSS" // 10:41:02.112
}
