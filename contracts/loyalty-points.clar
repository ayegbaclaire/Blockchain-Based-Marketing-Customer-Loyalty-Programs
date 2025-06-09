;; Loyalty Points Contract
;; Manages customer loyalty points with minting, burning, and transfer capabilities

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u200))
(define-constant ERR_INSUFFICIENT_BALANCE (err u201))
(define-constant ERR_INVALID_AMOUNT (err u202))

;; Data maps
(define-map point-balances principal uint)
(define-map total-earned principal uint)
(define-map authorized-minters principal bool)

;; Data vars
(define-data-var total-supply uint u0)

;; Read-only functions
(define-read-only (get-balance (customer principal))
    (default-to u0 (map-get? point-balances customer))
)

(define-read-only (get-total-earned (customer principal))
    (default-to u0 (map-get? total-earned customer))
)

(define-read-only (get-total-supply)
    (var-get total-supply)
)

(define-read-only (is-authorized-minter (minter principal))
    (default-to false (map-get? authorized-minters minter))
)

;; Private functions
(define-private (add-balance (customer principal) (amount uint))
    (let ((current-balance (get-balance customer)))
        (map-set point-balances customer (+ current-balance amount))
        (map-set total-earned customer (+ (get-total-earned customer) amount))
        (var-set total-supply (+ (var-get total-supply) amount))
    )
)

(define-private (subtract-balance (customer principal) (amount uint))
    (let ((current-balance (get-balance customer)))
        (asserts! (>= current-balance amount) ERR_INSUFFICIENT_BALANCE)
        (map-set point-balances customer (- current-balance amount))
        (var-set total-supply (- (var-get total-supply) amount))
        (ok true)
    )
)

;; Public functions
(define-public (authorize-minter (minter principal))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (map-set authorized-minters minter true)
        (ok true)
    )
)

(define-public (mint-points (customer principal) (amount uint))
    (begin
        (asserts! (> amount u0) ERR_INVALID_AMOUNT)
        (asserts! (is-authorized-minter tx-sender) ERR_UNAUTHORIZED)
        (add-balance customer amount)
        (ok amount)
    )
)

(define-public (burn-points (customer principal) (amount uint))
    (begin
        (asserts! (> amount u0) ERR_INVALID_AMOUNT)
        (asserts! (is-authorized-minter tx-sender) ERR_UNAUTHORIZED)
        (subtract-balance customer amount)
    )
)

(define-public (transfer-points (from principal) (to principal) (amount uint))
    (begin
        (asserts! (> amount u0) ERR_INVALID_AMOUNT)
        (asserts! (is-eq tx-sender from) ERR_UNAUTHORIZED)
        (try! (subtract-balance from amount))
        (add-balance to amount)
        (ok amount)
    )
)
