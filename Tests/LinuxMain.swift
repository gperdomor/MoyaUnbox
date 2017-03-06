import XCTest
import Quick
@testable import MoyaUnboxTests
@testable import ReactiveMoyaUnboxTests
@testable import RxMoyaUnboxTests

Quick.QCKMain([
    MoyaUnboxSpec.self,
    ReactiveMoyaUnboxSpec.self,
    RxMoyaUnboxSpec.self
])
