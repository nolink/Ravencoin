// Copyright (c) 2011-2014 The Bitcoin Core developers
// Copyright (c) 2017 The Carrot Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef CARROT_QT_RAVENADDRESSVALIDATOR_H
#define CARROT_QT_RAVENADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class CarrotAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CarrotAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Carrot address widget validator, checks for a valid raven address.
 */
class CarrotAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit CarrotAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // CARROT_QT_RAVENADDRESSVALIDATOR_H
